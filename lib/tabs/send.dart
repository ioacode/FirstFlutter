import 'package:flutter/material.dart'; 
import 'package:test_helloworld/model/datamodel.dart';
import 'package:test_helloworld/setting/ApiService.dart'; 

class send extends StatelessWidget {
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
    return new FutureBuilder<List<User>>(
      future: ApiService.fetchUsersFromGithub(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(snapshot.data[index].name,
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new Divider()
                    ]);
              });
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }
        return new CircularProgressIndicator();
      },
    );
  }
}