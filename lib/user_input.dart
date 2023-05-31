import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Set<Marker> _markers = {};
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  void _addMarker(double latitude, double longitude) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('${latitude}_${longitude}'),
          position: LatLng(latitude, longitude),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('- Find Your Own Location -',style: TextStyle(fontSize: 24,color: Colors.brown,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 2,
              ),
              markers: _markers,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _latitudeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Latitude',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _longitudeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Longitude',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    double? latitude = double.tryParse(_latitudeController.text);
                    double? longitude = double.tryParse(_longitudeController.text);

                    if (latitude != null && longitude != null) {
                      _addMarker(latitude, longitude);
                    }
                  },
                  child: const Text('Add Marker'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
