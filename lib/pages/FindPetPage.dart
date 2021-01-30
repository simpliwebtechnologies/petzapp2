import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petzapp/pages/PetConsultationPage.dart';
import 'package:petzapp/services/MyColorServices.dart';
import 'package:petzapp/widget/CarouselSliderWidget.dart';

class FindPet extends StatefulWidget {
  @override
  _FindPetPage createState() => _FindPetPage();
}

class _FindPetPage extends State<FindPet> {
  bool _isAppbar = true;
  ScrollController _scrollController = new ScrollController();

  List<String> icon =[
    'assets/images/icon7.png',
    'assets/images/icon8.png',
    'assets/images/icon9.png',
    'assets/images/icon10.png',
    'assets/images/icon11.png',
    'assets/images/icon12.png',
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
              width: (width-140)/2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Not available", style: TextStyle(fontSize: 13, color: MyColor.myBlack),maxLines: 1,),
                  Text("Certificate", style: TextStyle(fontSize: 11, color: MyColor.myLightGray119),maxLines: 1),
                ],
              ),
            ),
          ],
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined,color: Color.fromRGBO(119, 119, 119, 1),),
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
                        Text('Danny', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColor.myBlack),),
                        Row(
                          children: [
                            Image.asset('assets/images/rupee.png', width: 10, color: MyColor.myBlack,),
                            Text('15000', style: TextStyle(fontSize: 14, color: MyColor.myBlack),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
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
                        SizedBox(width: 15,),

                        GestureDetector(
                          onTap: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => PetConsult()));
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 1, color: MyColor.myDarkCyan),
                            ),
                            child: Center(
                              child: Icon(Icons.favorite_border, color: MyColor.myDarkCyan,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),

              Container(
                width: width-56,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Labrador Retriever | Foreign Breeds', style: TextStyle(fontSize: 12, color: MyColor.myDarkCyan),),
                    SizedBox(height: 5,),
                    Text('Pets are part of our everyday lives and part of our families. They provide us with companionship but also with emotional support, reduce our stress levels.', style: TextStyle(fontSize: 12, color: MyColor.myBlack),),
                  ],
                ),
              ),
              SizedBox(height: 30,),

              Container(
                width: width-56,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Published by', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColor.myBlack),),
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: (width-56)*68/100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: MyColor.myLightGray231,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/profile.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                width: (width-130)*68/100,
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Joyce',style: TextStyle(fontSize: 13, color: MyColor.myDarkCyan, fontWeight: FontWeight.bold),maxLines: 1, overflow: TextOverflow.ellipsis,),
                                    SizedBox(height: 5,),
                                    Text('#15 10th Main Ramapuram Jayanagar, Bamgalore - 02',style: TextStyle(fontSize: 10, color: MyColor.myLightGray119),maxLines: 2, overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: (width-56)*32/100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Wed, Oct 10 2020', style: TextStyle(fontSize: 10, color: MyColor.myLightGray119),),
                              SizedBox(height: 10,),
                              Image.asset('assets/images/map-nav.png', width: 20,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),

              Container(
                width: width-56,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: MyColor.myLightGray214)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About The Pet', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColor.myBlack),),
                    SizedBox(height: 20,),

                    GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: ((width-56) / 100),
                      controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: getTraitsMenu(),
                    ),
                  ],
                ),
              ),

              Container(
                width: width-56,
                padding: EdgeInsets.only(top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Listing ID: 1321', style: TextStyle(fontSize: 12, color: MyColor.myBlack),),
                    Text('Report', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: MyColor.myBrightRed),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
       decoration: BoxDecoration(
         color: MyColor.myWhite,
         boxShadow: [
           BoxShadow(
             color: Color.fromRGBO(0, 0, 0, 0.1),
             spreadRadius: 5,
             blurRadius: 3,
             offset: Offset(1, 2), // changes position of shadow
           ),
         ],
       ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 150,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: MyColor.myDarkCyan,
              ),
              child: Text('Contact', style: TextStyle(fontSize: 12, color: MyColor.myWhite),textAlign: TextAlign.center,),
            ),

            Container(
              width: 100,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: MyColor.myWhite,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: MyColor.myDarkCyan),
              ),
              child: Text('Chat', style: TextStyle(fontSize: 12, color: MyColor.myDarkCyan),textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}