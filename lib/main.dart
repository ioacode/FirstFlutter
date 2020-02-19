import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Test"), //title of tab
        ),
        body: Container( //same with layout
          color: Colors.transparent,
          //margin: EdgeInsets.all(10), //give margin all edge
          //padding: EdgeInsets.all(10), //padding same all edge
          margin: EdgeInsets.fromLTRB(
              16, 16, 16, 16), //set margin Left Right, Top and Bottom
          padding: EdgeInsets.only(bottom: 10, top: 10), //set margin with type
          child: Container(
            //color: Colors.blue,  // give color child container
            //margin: EdgeInsets.all(10), // give marge same all edge
            //decoration: BoxDecoration(color: Colors.blue),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(24), // border Radius have mode
                gradient: LinearGradient(
                    //Create linear Gradient
                    begin:
                        Alignment.topLeft, //from TopCenter, topLeft, topRight
                    end: Alignment
                        .bottomRight, //to Bottom, bottomRight, bottomLeft
                    colors: <Color>[Colors.amber, Colors.blue] //color
                    )),
          ),
        ),
      ),
    );
  }
}
