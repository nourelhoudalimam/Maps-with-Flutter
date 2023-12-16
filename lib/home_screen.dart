import 'package:flutter/material.dart';
/*import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';*/
import 'package:maps/Model/Car.dart';
import 'package:maps/Model/MapWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Maps"),
        centerTitle: true,
        backgroundColor:Colors.blueGrey
       
      ),
      body:MapWidget(cars: generateCarDataset(5))
    );
  }
 
}

/*class _MapWidget extends StatefulWidget {
@override
  _MapWidgetState createState() => _MapWidgetState();
  @override
  Widget build(BuildContext context) {
    return 
         
        Stack(
          children: [FlutterMap(
             
        
              options:MapOptions(
          
          center: LatLng(36.8065, 10.1815), // Set your desired center
           zoom: 10.0,
               ),
            
              layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
          
               MarkerLayerOptions(
              markers: [
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.8065, 10.1815), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Color.fromARGB(255, 10, 100, 173)),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.8065, 10.1815); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
         /*       Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.8072, 10.1757), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Colors.red),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.8072, 10.1757); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.7968, 10.1766), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Colors.green),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.7968, 10.1766); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.8189, 10.1667), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Colors.yellow),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.8189, 10.1667); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.8385, 10.2421), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Colors.orange),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.8385, 10.2421); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.8028, 10.1531), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Colors.pink),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.8028, 10.1531); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.7882, 10.1965), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Colors.purple),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.7882, 10.1965); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.8065, 10.1685), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Colors.brown),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.8065, 10.1685); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.8155, 10.1506), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Color.fromARGB(255, 131, 131, 3)),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.8155, 10.1506); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.7963, 10.1614), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Colors.black),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.7963, 10.1614); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.8158, 10.1075), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Color.fromARGB(255, 119, 0, 0)),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.8158, 10.1075); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(36.8342, 10.1075), // Replace with your marker coordinates
                  builder: (context) => IconButton(
                    icon: Icon(Icons.location_on, color: Colors.grey),
                    onPressed: () async {
                      // Get the latitude and longitude of the marker
                      LatLng markerLocation = LatLng(36.8342, 10.1075); // Replace with your marker coordinates
            
                      // Reverse geocode to get the address
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(markerLocation.latitude, markerLocation.longitude);
            
                      // Show a pop-up with information
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Marker Information'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Latitude: ${markerLocation.latitude}'),
                              Text('Longitude: ${markerLocation.longitude}'),
                              Text('Address: ${placemarks.isNotEmpty ? placemarks[0].name : 'Unknown'}'),
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
                ),*/
              ],
            ),
             
          ],
          ),
         ]
        );
  }
  
 
}*/
