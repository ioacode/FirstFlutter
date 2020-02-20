import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'attr.dart';

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
                    //margin: EdgeInsets.symmetric(horizontal: 5.0),  // give margins to left and right
                    //decoration: BoxDecoration(color: Colors.amber), // Pemberian warna pada container Utama
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
    // TODO: implement initState
    super.initState();
    print(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          //color: Colors.cyanAccent, // Memberi warna pada container atas untuk perubahan warna
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 14,
                left: 24,
                child: Text(
                  "Numero\u00B9",
                  style: TextStyle(fontFamily: "AvenirBold", fontSize: 16),
                ),
              ),
              Positioned(
                top: 16,
                right: 24,
                child: new Text(
                  widget.index == 2
                      ? "DONE"
                      : "SKIP", //jika index sama dengan 2 response is DONE tapi jika tidak text SKIP
                  style: TextStyle(
                      fontFamily: "SultanNahia",
                      fontSize: 14,
                      color: textColor),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 48),
          height: MediaQuery.of(context).size.height - 208,
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
              //padding: EdgeInsets.only(left: 24, right: 24),
              padding: EdgeInsets.symmetric(horizontal: 55), //memberikan space left dan right dengan nilai yang sama
              child: new RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                      style: new TextStyle(fontSize: 14.0, color: Colors.black),
                      children: <TextSpan>[
                        new TextSpan(
                            text: description[widget.index],
                            style: new TextStyle(fontFamily: 'Avenir')),
                      ])),
            )
          ]),
        ), 
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24), //margin left and right handle with EdgeInsert.symetric horizontal
          //color: Colors.red, //color from contrainer
          height: 80, //height from margin
          child: Stack(children: <Widget>[
            DotsIndicators(widget.index),  //function to indicator when select index position
            Center(child: new Text(widget.index != 2 ? 'SCROLL RIGHT': '', style: TextStyle(fontFamily: "Avelir", fontSize:10),)),
            Positioned(top: widget.index != 2 ? 36 : 0, right: 0,child: widget.index != 2 ? Image.asset('assets/images/arrow.png', width: 30,):  LetsGo()) //position right value like arrow right and change text in last index
          ],),
        ), // memberi warna pada toolbar
      ],
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
    return ListView.builder(scrollDirection: Axis.horizontal,itemCount: 3, itemBuilder: (context, int index){
      return Container(
        margin: EdgeInsets.only(right: index != 2 ? 4 : 0),
        width: 10, 
        height: 10,
        decoration: BoxDecoration(border: Border.all(color: Colors.black) ,shape: BoxShape.circle, color: index == widget.pageIndex ? Colors.black : bgColor),  //make small crycle with border black and color white
      );
    },);
  }
}

class LetsGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Stack(children: <Widget>[
        Positioned(top: 32, left:24,child: Text("LET'S GO!", style: TextStyle(color: Colors.white, fontFamily: 'AvenirBold'),),)
      ],), 
      //Text("LET'S Go !", style: TextStyle(color: Colors.white),),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Test"), //title of tab
        ),
        body: Container(
          //same with layout
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
