import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';

class BusRoutePage extends StatefulWidget {
  @override
  _BusRoutePageState createState() => _BusRoutePageState();
}

class _BusRoutePageState extends State<BusRoutePage> {
  Set<Marker> _markers = HashSet<Marker>();

  GoogleMapController controller;

  void _onMapCreated(GoogleMapController controller) {
    controller = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(27.711132, 85.415632),
          infoWindow: InfoWindow(
            title: "Nepal Engineering College",
            snippet: "Changunarayan,Bhaktapur",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition:
                CameraPosition(target: LatLng(27.711132, 85.415632), zoom: 12),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text("Nec_Notify",
                style: TextStyle(
                    height: 1, fontSize: 20, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
