import 'package:flutter/material.dart';

class tabschat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.tv,
                size: 160.0,
                color: Colors.white,
              ),
              Text(
                "Tabs Chat",
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ),
      ),
    );
  }
}
