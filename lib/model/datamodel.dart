import 'dart:convert';

class Country {
  const Country(this.name, this.flag);
  final String name;
  final String flag;
}

class Mainmenu{
  const Mainmenu(this.name);
  final String name;
}

class Populermenu{
  const Populermenu(this.name);
  final String name;
}

class TitleMenu{
  const TitleMenu(this.nameTitle);
  final String nameTitle;
}

class User {
  String name;
  int id;
  User({this.name, this.id});
}

class userlogin{
  String Username;
  String email;

  userlogin();

  userlogin.fromJson(Map<String, dynamic> json)
          : Username = json['Username'],
            email = json['email'];

  Map<String, dynamic> toJson() =>{
    'Username': Username,
    'email': email,
  };
  
}