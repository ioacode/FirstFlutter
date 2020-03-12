import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_helloworld/menu.dart';
import 'package:test_helloworld/model/datamodel.dart';
import 'package:test_helloworld/setting/ApiService.dart';
import 'package:test_helloworld/setting/ApiSession.dart';

class LoginClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiSession apiSession = ApiSession();

    var titleRegister = Text(
      "Dont have Account, Please Register.",
      style: TextStyle(fontFamily: "SultanNahia", fontSize: 16),
    );

    var titleLogin = Text(
      "First Flutter",
      style: TextStyle(fontFamily: "AvenirBold", fontSize: 24),
    );

    var fieldusername = TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
          labelStyle: TextStyle(fontFamily: "Avelir", fontSize: 14)),
    );

    var fieldpassword = TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          labelStyle: TextStyle(fontFamily: "Avelir", fontSize: 14)),
    );

    var buttonLogin = RaisedButton(
      onPressed: () {
        var requestlogin = {
          "email": "slametsatimah@gmail.com",
          "password": "dontlookback"
        };

        var api = ApiService.login(requestlogin);
        api.then((response) {
          final Map parsed = json.decode(response);
      
          userlogin login = userlogin();
          login.Username = parsed['data']['Username'];
          login.email = parsed['data']['email'];
          apiSession.save('login', login);

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        }, onError: (error) {
          print("-------- login error ---------");
        });
      },
      child: const Text('Login',
          style: TextStyle(fontFamily: "Avelir", fontSize: 16)),
    );

    var containerLogin = Container(
        child: Column(children: <Widget>[
      Container(height: 48.0, child: titleLogin),
      SizedBox(height: 12),
      Container(height: 48.0, child: fieldusername),
      SizedBox(height: 12),
      Container(height: 48.0, child: fieldpassword),
      SizedBox(height: 16),
      Container(
          height: 48.0,
          width: MediaQuery.of(context).size.width,
          child: buttonLogin),
    ]));

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: MediaQuery.of(context).size.width - 100,
                    child: containerLogin,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              child: Center(child: titleRegister),
            ),
          )
        ],
      ),
    );
  }
}
