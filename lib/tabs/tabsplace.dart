import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class tabsplace extends StatelessWidget {
  final Set<Marker> _makers = {};
  final LatLng _currectPosition = LatLng(3.595196, 98.672226);

  @override
  Widget build(BuildContext context) {
    _makers.add(
      Marker(
          markerId: MarkerId("3.595196, 98.672226"),
          position: _currectPosition,
          icon: BitmapDescriptor.defaultMarker),
    );

    return Scaffold( 
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(3.595196, 98.672226), zoom: 50.0),
        markers: _makers,
      ),
    );
  }
}
