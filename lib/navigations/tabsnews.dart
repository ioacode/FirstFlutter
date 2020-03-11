import 'package:flutter/material.dart';
import 'package:test_helloworld/model/datamodel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:test_helloworld/setting/utility.dart';

class tabsnews extends StatelessWidget {
  final List<Mainmenu> allMenu = <Mainmenu>[
    Mainmenu('Login'),
    Mainmenu('Register'),
    Mainmenu('Pembayaran'),
    Mainmenu('Cabang'),
    Mainmenu('Pembelian'),
    Mainmenu('Informasi'),
    Mainmenu('Produk'),
    Mainmenu('Jadwal Sholat'),
    Mainmenu('Ayat'),
    Mainmenu('Hadist'),
    Mainmenu('Pengajuan'),
    Mainmenu('Card'),
    Mainmenu('Mainmenu')
  ];

  final List<Populermenu> allPopulerMenu = <Populermenu>[
    Populermenu('Transfer'),
    Populermenu('Pembayaran'),
    Populermenu('Pembelian'),
    Populermenu('QR Code')
  ];

  @override
  Widget build(BuildContext context) {
    double heightAll = MediaQuery.of(context).size.height;
    double heightTopLayout = heightAll / 3.0;
    double heightTopContent = heightTopLayout / 3.0;
    double heightTopItem = heightTopLayout / 3.0;

    return Column(children: <Widget>[
      Container(
          height: heightTopLayout,
          child: Stack(children: <Widget>[
            Container(color: Colors.lightGreen),
            Container(margin: EdgeInsets.only(top: 50.0), color: Colors.white),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.lightGreen,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 8),
                            Container(
                              height: heightTopContent,
                              width: heightTopContent,
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 24.0,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("WELCOME FLUTTER",
                                style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            SizedBox(height: 8),
                            Container(
                              height: heightTopItem,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: ListView.builder(
                                      itemCount: allPopulerMenu.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return ClipPath(
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                  margin: EdgeInsets.all(4),
                                                  height: heightTopItem / 1.7,
                                                  width: heightTopItem / 1.7,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 16.0,
                                                  )),
                                              SizedBox(height: 4),
                                              Text(
                                                allPopulerMenu[index].name,
                                                style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 12),
                                                maxLines: 3,
                                              ),
                                            ],
                                          ),
                                        );
                                      })),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ])),
      SizedBox(height: 8),
      Expanded(
          child: Container(
              margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
              color: Colors.white,
              child: GridView.builder(
                  itemCount: allMenu.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    return ClipPath(
                        child: GestureDetector(
                      onTap: () {
                        Alert(
                                context: context,
                                title: allMenu[index].name,
                                desc: "Your Touch : " + allMenu[index].name)
                            .show();
                      },
                      child: Container(
                          decoration: myBoxDecoration(),
                          child: Row(children: <Widget>[
                            new Flexible(
                              child: new Column(
                                children: <Widget>[
                                  SizedBox(height: 4),
                                  Center(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightGreen,
                                      radius: 22.0,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                      child: Text(
                                    allMenu[index].name,
                                    style: TextStyle(
                                        fontFamily: 'Avenir', fontSize: 10),
                                  ))
                                ],
                              ),
                            )
                          ])),
                    ));
                  }))),
    ]);
  }
}
