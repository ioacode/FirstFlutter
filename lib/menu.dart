import 'package:flutter/material.dart';
import 'package:test_helloworld/tabs/tabschat.dart';
import 'package:test_helloworld/tabs/tabslogin.dart';
import 'package:test_helloworld/tabs/tabsnews.dart';
import 'package:test_helloworld/tabs/tabsplace.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tutorial Flutter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: TabBarView(
        children: <Widget>[tabsnews(), tabsplace(), tabschat(), tabslogin()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
          color: Colors.blueGrey,
          child: TabBar(
            tabs: <Tab>[
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.place)),
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.brush)),
            ],
            controller: controller,
          )),
    );
  }
}
