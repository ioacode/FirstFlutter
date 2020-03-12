import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:test_helloworld/model/datamodel.dart';
import 'package:test_helloworld/setting/ApiService.dart';

class inbox extends StatelessWidget {
  final List<Country> allCountries = <Country>[
    Country('Indonesia', 'merah putih'),
    Country('Singapura', 'merah bersinga'),
    Country('Brunei Darussalam', 'Dominan Kuning bersimbol'),
    Country('Malaysia', 'Mirip Amerika serikat'),
    Country('Thailand', 'Dominan Warna biru dan merah serta putih'),
    Country('Vietnam', 'Dominan Merah berbintang'),
    Country('Myanmar', 'Mirip dengan camiroon tapi dia bersimbol'),
    Country('Laos', 'Mirip dengan Thialand tapi bersimbol putih lingkaran'),
    Country('Kamboja', 'Mirip dengan Thailand dan bersimbol'),
    Country('China', 'Warna Merah dengan simbol warna kuning'),
    Country('Japan', 'Warna dengan model yang berrbeda'),
    Country('Inggris', 'Warna Putih dengan model salip'),
    Country('Amerika Serikat', 'Warnanya hampir mirip dengan Malaysia'),
    Country('Spayol', 'Warnanya keren habis'),
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: allCountries == null ? 0 : allCountries.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
              child: new InkWell(
                  onTap: () {
                    Alert(
                            context: context,
                            title: "Negara " + allCountries[index].name,
                            desc: "Bendera " + allCountries[index].flag)
                        .show();
                  },
                  child: new Container(
                      child: new Row(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.all(8),
                        height: 80,
                        width: 80,
                        child: new CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                          radius: 24.0,
                        ),
                      ),
                      new Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Container(
                            child: new Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  allCountries[index].name,
                                  style: new TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                new Text(
                                  "Bendera : " + allCountries[index].flag,
                                  style: new TextStyle(
                                      fontFamily: 'Avenir', fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                new Text(
                                  "30 PLACES",
                                  style: new TextStyle(
                                      fontFamily: 'Avenir', fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ))));
        });
  }
}
