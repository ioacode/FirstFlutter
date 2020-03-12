import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_helloworld/model/datamodel.dart';
import 'package:test_helloworld/setting/utility.dart';

class tabsplace extends StatelessWidget {
  final Set<Marker> _makers = {};
  final LatLng _currectPosition = LatLng(3.595196, 98.672226);

  final List<Populermenu> locationPosition = <Populermenu>[
    Populermenu('Surabaya'),
    Populermenu('Sidoarjo'),
    Populermenu('Mojokerto'),
    Populermenu('Jombang'),
    Populermenu('Kediri'),
    Populermenu('Blitar'),
    Populermenu('Malang'),
    Populermenu('Pasuruan'),
  ];

  @override
  Widget build(BuildContext context) {
    double heightListData = MediaQuery.of(context).size.height / 6;
    double heighContentList = heightListData / 2;
    double heighContentText = heightListData - heighContentList;

    _makers.add(
      Marker(
          markerId: MarkerId("3.595196, 98.672226"),
          position: _currectPosition,
          icon: BitmapDescriptor.defaultMarker),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Search Locatoin',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("-------- search location  -------");
            },
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: GoogleMap(
                onTap: (position) {
                  _makers.add(
                    Marker(
                        markerId: MarkerId(
                            "${position.latitude}, ${position.longitude}"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: position),
                  );
                },
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(3.595196, 98.672226), zoom: 14.0),
                markers: _makers,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: heightListData,
                margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
                child: ListView.builder(
                    itemCount: locationPosition.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ClipPath(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          decoration: myBoxDecoration(),
                          child: Column(children: <Widget>[
                            SizedBox(width: 8),
                            Container(
                              margin: EdgeInsets.all(8),
                              height: heighContentList,
                              width: heighContentList,
                              child: CircleAvatar(
                                  backgroundColor: Colors.lightGreen,
                                  radius: 16.0),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 4, right: 4),
                              width: heightListData - 16,
                              height: heighContentText - 20,
                              child: Center(
                                child: Text(
                                  locationPosition[index].name,
                                  style: TextStyle(
                                      fontFamily: 'Avenir', fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
