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
      target: LatLng(6.883274, 79.8852994),
      zoom: 19,
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _ousl,
        mapType: MapType.normal,
        compassEnabled: false,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}