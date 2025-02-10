import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapPickPage extends StatefulWidget {
  @override
  State<MapPickPage> createState() => _MapPickPageState();
}

class _MapPickPageState extends State<MapPickPage> {
  final Completer<GoogleMapController> _completer = Completer();
  late GoogleMapController _mapController;
  List<LatLng> _polylineCoordinates = [];
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  List<Prediction> _predictions = [];
  final String _googleApiKey = 'AIzaSyBqzMrs0fNGm16PWp3izxXQ0cToMK_lgzA';
  bool _isFromFieldActive = true;
  String _travelMode = "driving";

  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
  }

  void _initializeMarkers() {
    setState(() {
      _markers.addAll([
        Marker(
          markerId: MarkerId('aysha_bibi'),
          position: LatLng(42.8535, 71.3748),
          infoWindow: InfoWindow(
            title: 'Мавзолей Айша Биби',
            onTap: () => _showPlaceInfo(
              'Мавзолей Айша Биби',
              'Уникальный памятник XI-XII веков, расположенный недалеко от Тараза.',
            ),
          ),
        ),
        // Add more markers if needed
      ]);
    });
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

  Future<void> getRoute(String from, String to) async {
    final url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$from&destination=$to&mode=$_travelMode&key=$_googleApiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['routes'].isNotEmpty) {
        final route = data['routes'][0]['legs'][0]['steps'];

        List<LatLng> newPolylineCoordinates = [];
        for (var step in route) {
          final startLat = step['start_location']['lat'];
          final startLng = step['start_location']['lng'];
          newPolylineCoordinates.add(LatLng(startLat, startLng));
        }

        setState(() {
          _polylineCoordinates = newPolylineCoordinates;
        });

        final bounds = LatLngBounds(
          southwest: LatLng(data['routes'][0]['bounds']['southwest']['lat'],
              data['routes'][0]['bounds']['southwest']['lng']),
          northeast: LatLng(data['routes'][0]['bounds']['northeast']['lat'],
              data['routes'][0]['bounds']['northeast']['lng']),
        );
        _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
      }
    } else {
      throw Exception('error');
    }
  }

  void _showPlaceInfo(String title, String description) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            compassEnabled: true,
            trafficEnabled: true,
            // mapToolbarEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(42.8991, 71.3674),
              zoom: 12,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
              _completer.complete(controller);
            },
            markers: Set<Marker>.of(_markers),
            polylines: {
              Polyline(
                polylineId: const PolylineId('route'),
                color: Colors.red,
                width: 5,
                points: _polylineCoordinates,
              ),
            },
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Column(
              children: [
                _buildSearchField(
                  controller: _fromController,
                  hintText: "Жамбыл Инновациялык Жогаргы колледжра",
                  onChanged: (text) {
                    setState(() {
                      _isFromFieldActive = true;
                    });
                    getPredictions(text, _fromController);
                  },
                ),
                const SizedBox(height: 10),
                _buildSearchField(
                  controller: _toController,
                  hintText: "Куда",
                  onChanged: (text) {
                    setState(() {
                      _isFromFieldActive = false;
                    });
                    getPredictions(text, _toController);
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final from = _fromController.text;
                    final to = _toController.text;

                    if (from.isNotEmpty && to.isNotEmpty) {
                      await getRoute(from, to);
                      _predictions.clear();
                    }
                  },
                  child: Text('Найти маршрут'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _travelMode = "driving";
                        });
                      },
                      child: Text("Driving"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _travelMode = "walking";
                        });
                      },
                      child: Text("Walking"),
                    ),
                  ],
                ),
                if (_predictions.isNotEmpty)
                  ..._predictions.map((prediction) {
                    return ListTile(
                      title: Text(prediction.description),
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
                    );
                  }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField({
    required TextEditingController controller,
    required String hintText,
    required Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
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
