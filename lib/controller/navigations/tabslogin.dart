import 'package:flutter/material.dart';

class tabslogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.warning,
              size: 160.0,
              color: Colors.white,
            ),
            Text(
              "Tabs Login",
              style: TextStyle(color: Colors.white),
            )
          ],
        )),
      ),
    );
  }
}
