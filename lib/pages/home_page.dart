import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _ousl = const CameraPosition(
      target: LatLng(6.8830473, 79.8863484),
      zoom: 19,
  );

  List<Marker> _marker = [];
  List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(6.8830473,79.8863484),
      infoWindow: InfoWindow(
        title: "My location",
      )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(6.886280, 79.883068),
        infoWindow: InfoWindow(
          title: "OUSL Library",
        )
    )
  ];

  @override
  void initState(){
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _ousl,
          markers: Set.of(_marker),
          mapType: MapType.normal,
          compassEnabled: false,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(6.886280, 79.883068),
                  zoom: 14,
                )
              )
          );
          setState(() {

          });
        },
      ),
    );
  }
}