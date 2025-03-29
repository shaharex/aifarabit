import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:ai_farabi/src/core/constants/app_colors.dart';
import 'package:ai_farabi/src/core/utils/utils.dart';
import 'package:ai_farabi/src/core/widgets/widgets.dart';

class MapPickPage extends StatefulWidget {
  final LatLng latLng;
  const MapPickPage({super.key, required this.latLng});
  @override
  State<MapPickPage> createState() => _MapPickPageState();
}

class _MapPickPageState extends State<MapPickPage> {
  final Completer<GoogleMapController> _completer = Completer();
  late GoogleMapController _mapController;
  String _mapTheme = '';
  List<LatLng> _polylineCoordinates = [];
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  List<Prediction> _predictions = [];
  final String _googleApiKey = 'AIzaSyBqzMrs0fNGm16PWp3izxXQ0cToMK_lgzA';
  bool _isFromFieldActive = true;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initializeMarker();
    _getAddressFromLatLng();
    // DefaultAssetBundle.of(context)
    //     .loadString("assets/map_theme/dark_theme.json")
    //     .then((value) {
    //   setState(() {
    //     _mapTheme = value;
    //   });
    // });
  }

  void _initializeMarker() {
    _getCurrentLocation();
    _markers.add(
      Marker(
        markerId: MarkerId('destination'),
        position: widget.latLng,
        infoWindow: InfoWindow(title: 'Destination'),
      ),
    );
  }

  Future<void> _getAddressFromLatLng() async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${widget.latLng.latitude},${widget.latLng.longitude}&key=$_googleApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['results'].isNotEmpty) {
        setState(() {
          _toController.text = data['results'][0]['formatted_address'];
        });
      }
    }
  }

  Future<void> getPredictions(
      String input, TextEditingController controller) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$_googleApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _predictions = (data['predictions'] as List)
            .map((prediction) => Prediction.fromJson(prediction))
            .toList();
      });
    }
  }

  String _distance = '';
  String _duration = '';

  Future<void> getRoute(String from, String to) async {
    try {
      final url =
          "https://maps.googleapis.com/maps/api/directions/json?origin=$from&destination=$to&key=$_googleApiKey";

      print('Fetching route from: $from to: $to');
      final response = await http.get(Uri.parse(url));
      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Response data: ${response.body}');

        if (data['routes'].isNotEmpty) {
          final route = data['routes'][0]['legs'][0];

          setState(() {
            _distance = route['distance']['text'];
            _duration = route['duration']['text'];
          });
          print('Distance: $_distance, Duration: $_duration');

          List<LatLng> newPolylineCoordinates = [];

          final points = data['routes'][0]['overview_polyline']['points'];
          newPolylineCoordinates = _decodePolyline(points);

          setState(() {
            _polylineCoordinates = newPolylineCoordinates;
          });

          if (newPolylineCoordinates.isNotEmpty) {
            final bounds = LatLngBounds(
              southwest: LatLng(
                data['routes'][0]['bounds']['southwest']['lat'],
                data['routes'][0]['bounds']['southwest']['lng'],
              ),
              northeast: LatLng(
                data['routes'][0]['bounds']['northeast']['lat'],
                data['routes'][0]['bounds']['northeast']['lng'],
              ),
            );
            _mapController
                .animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
          }
        } else {
          print('No routes found');
        }
      } else {
        print('Failed to fetch route: ${response.statusCode}');
        throw Exception('Failed to fetch route');
      }
    } catch (e) {
      print('Error getting route: $e');
      // Show error to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error getting route: $e')),
      );
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> poly = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      double latitude = lat / 1E5;
      double longitude = lng / 1E5;
      poly.add(LatLng(latitude, longitude));
    }
    return poly;
  }

  Future<void> _getCurrentLocation() async {
    final position = await LocationService().getCurrentLocation();
    print('Current location: ${position.toString()}');

    // Get address from coordinates
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$_googleApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['results'].isNotEmpty) {
        setState(() {
          _fromController.text = data['results'][0]['formatted_address'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          final position = await LocationService().getCurrentLocation();
          final currentLatLng = LatLng(position.latitude, position.longitude);
          
          setState(() {
            _markers.add(
              Marker(
                markerId: const MarkerId('current_location'),
                position: currentLatLng,
                infoWindow: const InfoWindow(title: 'Your Location'),
              ),
            );
            _mapController.animateCamera(
              CameraUpdate.newLatLngZoom(currentLatLng, 15),
            );
          });
        },
        child: Icon(
          Icons.location_on,
          color: AppColors.iconsColor,
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            // mapType: MapType.terrain,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: widget.latLng,
              zoom: 15,
            ),
            markers: _markers,
            onMapCreated: (controller) {
              _mapController = controller;
              controller.setMapStyle(_mapTheme);
              _completer.complete(controller);
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId('route'),
                color: AppColors.iconsColor,
                width: 5,
                points: _polylineCoordinates,
              ),
            },
          ),
          Positioned(
            bottom: 45,
            left: 16,
            right: 16,
            child: Column(
              children: [
                if (_distance.isNotEmpty && _duration.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Distance: $_distance\nDuration: $_duration',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 16,
            right: 16,
            child: Column(
              children: [
                CustomTextField(
                  hintText: "Откуда",
                  controller: _fromController,
                  textChanged: (text) {
                    setState(() {
                      _isFromFieldActive = true;
                    });
                    getPredictions(text, _fromController);
                  },
                  prefixIcon: const Icon(Icons.search),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Куда",
                  controller: _toController,
                  textChanged: (text) {
                    setState(() {
                      _isFromFieldActive = false;
                    });
                    getPredictions(text, _toController);
                  },
                  prefixIcon: const Icon(Icons.search),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  btnColor: Colors.black,
                  textColor: Colors.white,
                  text: "Find Route",
                  onTap: () async {
                    final from = _fromController.text;
                    final to = _toController.text;

                    if (from.isNotEmpty && to.isNotEmpty) {
                      await getRoute(from, to);
                      _predictions.clear();
                    }
                  },
                ),
                if (_predictions.isNotEmpty)
                  ..._predictions.map((prediction) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_isFromFieldActive) {
                            _fromController.text = prediction.description;
                          } else {
                            _toController.text = prediction.description;
                          }
                          _predictions.clear();
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          '${prediction.description},',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Prediction {
  final String description;
  final String placeId;

  Prediction({required this.description, required this.placeId});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      description: json['description'],
      placeId: json['place_id'],
    );
  }
}
