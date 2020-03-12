import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:test_helloworld/model/datamodel.dart';

class URLS {
  static const String BASE_URL = 'https://api.github.com/users';
  static const String BASE_URL_LOCAL = 'http://15.0.0.83:3030';
}

class ApiService {
  static Future<List<User>> fetchUsersFromGithub() async {
    final response = await http.get('${URLS.BASE_URL}');
    List responseJson = json.decode(response.body.toString());
    List<User> userList = createUserList(responseJson);
    return userList;
  }

  static Future login(requestdata) async {
    final response =
        await http.post('${URLS.BASE_URL_LOCAL}/user/login', body: requestdata);
    return response.body;
  }
}

List<User> createUserList(List data) {
  List<User> list = new List();
  for (int i = 0; i < data.length; i++) {
    String title = data[i]["login"];
    int idd = data[i]["id"];
    User movie = new User(name: title, id: idd);
    list.add(movie);
  }
  return list;
}