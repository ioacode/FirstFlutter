import 'package:flutter/foundation.dart';
import 'package:test_helloworld/model/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:test_helloworld/tabs/inbox.dart';
import 'package:test_helloworld/tabs/send.dart';

class tabschat extends StatelessWidget {
  final List<Country> country;
  tabschat({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
              child: TabBar(
            tabs: [
              Tab(text: "Inbox", icon: Icon(Icons.inbox)),
              Tab(text: "Send", icon: Icon(Icons.send)),
            ],
          )),
        ),
        body: TabBarView(
          children: [
            send(),
            inbox(),
          ],
        ),
      ),
    );
  }
}
