import 'package:http/http.dart' as http; 
import 'dart:async';
import 'dart:convert';

import 'package:test_helloworld/tabs/send.dart';


class URLS  {
  static const String BASE_URL = 'https://api.github.com/users';
}

class ApiService{ 
  static Future<List<User>>  fetchUsersFromGithub() async{
    final response = await http.get('${URLS.BASE_URL}');
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<User> userList = createUserList(responseJson);
    return userList;
  }
}


 List<User>  createUserList(List data){
    List<User> list = new List();
    for(int i = 0; i< data.length; i++){
      String title = data[i]["login"];
      int idd = data[i]["id"];
      User movie = new User(name:title, id:idd);
      list.add(movie); 
    }
    return list;
  }
