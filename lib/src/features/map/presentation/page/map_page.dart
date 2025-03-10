import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jihc_hack/src/core/constants/app_colors.dart';
import 'package:jihc_hack/src/core/widgets/widgets.dart';

class MapPickPage extends StatefulWidget {
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

  @override
  void initState() {
    super.initState();
    // DefaultAssetBundle.of(context)
    //     .loadString("assets/map_theme/dark_theme.json")
    //     .then((value) {
    //   setState(() {
    //     _mapTheme = value;
    //   });
    // });
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
    final url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$from&destination=$to&key=$_googleApiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['routes'].isNotEmpty) {
        final route = data['routes'][0]['legs'][0];

        setState(() {
          _distance = route['distance']['text'];
          _duration = route['duration']['text'];
        });

        List<LatLng> newPolylineCoordinates = [];
        for (var step in route['steps']) {
          final startLat = step['start_location']['lat'];
          final startLng = step['start_location']['lng'];
          newPolylineCoordinates.add(LatLng(startLat, startLng));
        }

        setState(() {
          _polylineCoordinates = newPolylineCoordinates;
        });

        // Adjust camera bounds
        final bounds = LatLngBounds(
          southwest: LatLng(data['routes'][0]['bounds']['southwest']['lat'],
              data['routes'][0]['bounds']['southwest']['lng']),
          northeast: LatLng(data['routes'][0]['bounds']['northeast']['lat'],
              data['routes'][0]['bounds']['northeast']['lng']),
        );
        _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
      }
    } else {
      throw Exception('Failed to fetch route');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            // mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(43.238949, 76.889709),
              zoom: 12,
            ),
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
            bottom: 20,
            left: 16,
            right: 16,
            child: Column(
              children: [
                if (_distance.isNotEmpty && _duration.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Distance: $_distance\nDuration: $_duration',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: AppColors.iconsColor, fontSize: 20),
                    ),
                    width: double.infinity,
                  ),
              ],
            ),
          ),
          Positioned(
            top: 50,
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
                  controller: _fromController,
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
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          prediction.description,
                          style: TextStyle(color: Colors.white),
                        ),
                        color: AppColors.backgroundColor,
                        width: double.infinity,
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
