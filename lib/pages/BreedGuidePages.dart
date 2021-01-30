import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petzapp/pages/FindPetPage.dart';
import 'package:petzapp/pages/PetConsultationPage.dart';
import 'package:petzapp/services/MyColorServices.dart';
import 'package:petzapp/widget/CarouselSliderWidget.dart';

class BreedGuide extends StatefulWidget {
  @override
  _BreedGuidePage createState() => _BreedGuidePage();
}

class _BreedGuidePage extends State<BreedGuide> {
  bool _isAppbar = true;
  ScrollController _scrollController = new ScrollController();

  List<String> icon =[
    'assets/images/icon1.png',
    'assets/images/icon2.png',
    'assets/images/icon3.png',
    'assets/images/icon4.png',
    'assets/images/icon5.png',
    'assets/images/icon6.png',
  ];
  getTraitsMenu() {
    List<Widget> data = new List<Widget>();
    final width = MediaQuery.of(context).size.width;
    for(int i=0; i<icon.length; i++) {
      data.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(icon[i], width: 30,),
            Container(
              width: (width-170)/2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("10-12 years", style: TextStyle(fontSize: 13, color: MyColor.myBlack),maxLines: 1,),
                  Text("Life expectancy", style: TextStyle(fontSize: 11, color: MyColor.myLightGray119),maxLines: 1),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return data;
  }

  getSpeciality() {
    List<Widget> data = new List<Widget>();
    final width = MediaQuery.of(context).size.width;
    for (int i = 0; i < 5; i++) {
      data.add(
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: MyColor.myLightBlue,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: MyColor.myBrightBlue),
          ),
          child: Text('Loyal', style: TextStyle(fontSize: 10, color: MyColor.myBlack),textAlign: TextAlign.center,),
        ),
      );
    }
    return data;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        appBarStatus(false);
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        appBarStatus(true);
      }
    });
  }

  void appBarStatus(bool status) {
    setState(() {
      _isAppbar = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: MyColor.myLightGray119,),
        ),
        titleSpacing: 0,
        elevation: 0,
        title: Text("Breed Guide", style: TextStyle(fontSize: 20, color: MyColor.myBlack),),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          color: MyColor.myWhite,
          child: Column(
            children: [
              CarouselSliders(),
              Container(
                width: width-56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FindPet()));
                          },
                            child: Text('Labrador Retriever', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColor.myBlack),)),
                        Text('Foreign Breeds', style: TextStyle(fontSize: 14, color: MyColor.myDarkCyan),),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PetConsult()));
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 1, color: MyColor.myDarkCyan),
                        ),
                        child: Center(
                          child: Icon(Icons.share_outlined, color: MyColor.myDarkCyan,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: width-56,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(1, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Traits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColor.myBlack),),
                    SizedBox(height: 20,),

                    GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: ((width-86) / 100),
                      controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: getTraitsMenu(),
                    ),
                    SizedBox(height: 10,),
                    Text('Temperament', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColor.myBlack),),
                    SizedBox(height: 20,),
                    Progress(),
                    Progress(),
                    Progress(),
                    Progress(),
                    Progress(),
                  ],
                ),
              ),

              Container(
                width: width-56,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(1, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Speciality', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColor.myBlack),),
                    SizedBox(height: 20,),
                    GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: ((width-86) / 100),
                      controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: getSpeciality(),
                    ),
                  ],
                ),
              ),

              Container(
                width: width-56,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(1, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColor.myBlack),),
                    SizedBox(height: 20,),
                    Text('Flutter is a cross-platform UI toolkit that is designed to allow code reuse across operating systems such as iOS and Android, while also allowing applications to interface directly with underlying platform services', style: TextStyle(fontSize: 14, color: MyColor.myBlack),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 106,
      margin: EdgeInsets.only(left: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Loyal',
            style: TextStyle(fontSize: 13, color: MyColor.myBlack),
          ),
          SizedBox(
            height: 5,
          ),
          LinearProgressIndicator(
            value: 0.5,
            backgroundColor: MyColor.myLightGray231,
            valueColor: new AlwaysStoppedAnimation<Color>(MyColor.myDarkCyan),
          ),
        ],
      ),
    );
  }
}