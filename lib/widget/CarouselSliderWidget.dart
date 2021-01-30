import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzapp/services/MyColorServices.dart';

class CarouselSliders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselSlidersState();
  }
}

class _CarouselSlidersState extends State<CarouselSliders> {
  int _current = 0;

  final List<String> homeBanner = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
    'assets/images/img8.png',
  ];

  getSlider() {
    List<Widget> list = new List<Widget>();
    for (int i = 0; i < homeBanner.length; i++) {
      list.add(Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          image: DecorationImage(
            image: AssetImage(homeBanner[i]),
            fit: BoxFit.cover,
          ),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      height: 250,
      child:
      Stack(children: [
        CarouselSlider(
          items: getSlider(),
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              height: 250,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Positioned(
          bottom: 50,
          child: Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: homeBanner.map((url) {
                int index = homeBanner.indexOf(url);
                return Container(
                  width: _current == index?33.0:10,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _current == index
                        ? MyColor.myDarkCyan
                        : MyColor.myLightGray214,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: width,
            height: 30,
            decoration: BoxDecoration(
              color: MyColor.myWhite,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
          ),
        ),
      ]),
    );
  }
}
