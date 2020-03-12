import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:test_helloworld/model/bidangusaha.dart';

Future<String> _loadBidangusahaAsset() async{
  return await rootBundle.loadString('');
}

Future loadBidangusaha() async{
  String jsonString = await _loadBidangusahaAsset();
  final jsonResponse = json.decode(jsonString);
  bidangUsaha bidangusaha = new bidangUsaha.fromjson(jsonResponse);
  print(bidangusaha.Bidangusahacode); 
}