import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_helloworld/login.dart';
import 'attr.dart';
import 'login.dart';

//void main() => runApp(MyApp());
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application intro',
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: CarouselSlider(
          autoPlay: false,
          enableInfiniteScroll: false,
          initialPage: 0,
          reverse: false,
          viewportFraction: 1.0,
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          height: MediaQuery.of(context).size.height - 30,
          items: [0, 1, 2].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    color: bgColor,
                    child: AppIntro(i));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class AppIntro extends StatefulWidget {
  int index;
  AppIntro(this.index);
  @override
  _AppIntroState createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  @override
  void initState() {
    super.initState();
    print(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 14,
                        left: 14,
                        child: Text(
                          "Numero\u00B9",
                          style:
                              TextStyle(fontFamily: "AvenirBold", fontSize: 16),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 24,
                        child: new Text(
                          widget.index == 2 ? "DONE" : "SKIP",
                          style: TextStyle(
                              fontFamily: "SultanNahia",
                              fontSize: 14,
                              color: textColor),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 208,
                child: Center(
                  child: Column(children: <Widget>[
                    Image.asset(
                      imagePath[widget.index],
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Center(
                          child: new Text(
                        title[widget.index],
                        style: TextStyle(fontFamily: "Caslon", fontSize: 30),
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 55),
                      child: new RichText(
                          textAlign: TextAlign.center,
                          text: new TextSpan(
                              style: new TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: description[widget.index],
                                    style: new TextStyle(fontFamily: 'Avenir')),
                              ])),
                    )
                  ]),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      DotsIndicators(widget.index),
                      Center(
                          child: new Text(
                        widget.index != 2 ? 'SCROLL RIGHT' : '',
                        style: TextStyle(fontFamily: "Avelir", fontSize: 10),
                      )),
                      Positioned(
                          top: widget.index != 2 ? 36 : 0,
                          right: 0,
                          child: widget.index != 2
                              ? Image.asset(
                                  'assets/images/arrow.png',
                                  width: 30,
                                )
                              : LetsGo()) //position right value like arrow right and change text in last index
                    ],
                  ),
                )),
          ]),
    );
  }
}

class DotsIndicators extends StatefulWidget {
  int pageIndex;
  DotsIndicators(this.pageIndex);
  @override
  _DotsIndicatorsState createState() => _DotsIndicatorsState();
}

class _DotsIndicatorsState extends State<DotsIndicators> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, int index) {
        return Container(
          margin: EdgeInsets.only(right: index != 2 ? 4 : 0),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle,
              color: index == widget.pageIndex
                  ? Colors.black
                  : bgColor), //make small crycle with border black and color white
        );
      },
    );
  }
}

class LetsGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginClass()));
        },
        child: new Text("Click Here", style: TextStyle(color: Colors.red)),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Test"),
        ),
        body: Container(
          color: Colors.transparent,
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.amber, Colors.blue] //color
                    )),
          ),
        ),
      ),
    );
  }
}
