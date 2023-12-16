import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:maps/Model/Car.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class MapWidget extends StatefulWidget {
  final List<Car> cars;

  MapWidget({required this.cars});

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
 late Timer timer;

  @override
  void initState() {
    super.initState();
    // Set up a timer to simulate the movement of cars every second
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      moveCars();
      setState(() {}); // Trigger a rebuild to update marker positions
    });
  }

void moveCars() {
    final Random random = Random();


  widget.cars.forEach((car) {
    // Generate random values for latitude and longitude adjustments
    double latAdjustment = (random.nextDouble() - 0.5) * 0.1; // Random value between -0.05 and 0.05
    double lonAdjustment = (random.nextDouble() - 0.5) * 0.1; // Random value between -0.05 and 0.05

    car.latitude += latAdjustment; // Update latitude
    car.longitude += lonAdjustment; // Update longitude
    sendCarMovementData(car.latitude, car.longitude,car.markerColor);

  });// Update latitude (change as needed)
    }    
  
void sendCarMovementData( double latitude, double longitude,Color color) async {
      Map<String, dynamic> carMovement = {'latitude':latitude, 'longitude': longitude,'markerColor':color.toString()};
;
widget.cars.forEach((car) async {
  try {
    final response = await http.post(
      Uri.parse('http://192.168.1.26:3000/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(carMovement),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Car movement data sent successfully.');
    } else {
      print('Error sending car movement data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending car movement data: $e');
  }});
}
/*void moveCars() async {
 final String apiUrl = 'https://api.distancematrix.ai/maps/api/geocode/json?parameters';
; // Remplacez ceci par l'URL de votre API

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> apiData = json.decode(response.body);

      // Utilisez les données de l'API pour mettre à jour les positions des voitures
      for (int i = 0; i < widget.cars.length && i < apiData.length; i++) {
        widget.cars[i].latitude = double.parse(apiData[i]['latitude']);
        widget.cars[i].longitude = double.parse(apiData[i]['longitude']);
      }

      setState(() {});}; // Déclencher une reconstruction pour mettre à jour les positions des marqueurs
    } else {
      print('Erreur de requête - Statut: ${response.statusCode}, Corps: ${response.body}');
    }
  } catch (e) {
    print('Erreur de connexion : $e');
  }
}*/

  @override
  void dispose() {
    // Dispose of the timer to prevent memory leaks
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(36.8065, 10.1815), // Centered around Tunisia
        zoom: 7.0, // Default zoom level
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
      MarkerLayerOptions(
  markers: widget.cars
      .map(
        (car) => Marker(
          width: 40.0,
          height: 40.0,
          point: LatLng(car.latitude, car.longitude),
          builder: (context) => IconButton(
            icon: Icon(Icons.location_on, color:car.markerColor),
            onPressed: () async {
              // Get the latitude and longitude of the marker
              LatLng markerLocation = LatLng(car.latitude, car.longitude);

              // Reverse geocode to get the address
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);

              // Show a pop-up with information
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Car Information'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Latitude: ${markerLocation.latitude}'),
                      Text('Longitude: ${markerLocation.longitude}'),
                      Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
                      // Add more information as needed
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      )
      .toList(),
),

    ]);
  }

 

 
}