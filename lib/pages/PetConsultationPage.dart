import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzapp/pages/Petconsultpage.dart';
import 'package:petzapp/services/MyColorServices.dart';

class PetConsult extends StatefulWidget{
  @override
  _PetConsultState createState() => _PetConsultState();
}

class _PetConsultState extends State<PetConsult> {
  final List<String> image = [
    "assets/images/hens-head-close-up@2x.png",
    "assets/images/hens-head-close-up@2x.png",
    "assets/images/hens-head-close-up@2x.png",
    "assets/images/hens-head-close-up@2x.png",
  ];

  final List<String> name = [
    "Ace",
    "Bailey",
    "Apollo",
    "Apollo",
  ];

  final List<String> age = [
    "1 Year 3 Months",
    "1 Year 3 Months",
    "1 Year 3 Months",
    "1 Year 3 Months",
  ];
  final List<String> icons = [
    "assets/images/Group 3574@2x.png",
    "assets/images/Group 3574@2x.png",
    "assets/images/Group 3574@2x.png",
    "assets/images/Group 3574@2x.png",
  ];


  int selected=0;

  getProfileCard(){
    final width= MediaQuery.of(context).size.width;
    IconData selectedIcon;
    List<Widget> data=new List<Widget>();
    for(int i=0; i< image.length; i++) {
      data.add(
        GestureDetector(
          onTap: (){
            setState(() {
              selected=i;
            });
          },
          child: Container(
            width: (width-35)/2,
            height: 255,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 255,
                  width: (width-75)/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    border: selected==i?Border.all(width: 2.0,color: Color.fromRGBO(26, 125, 125, 1)):null,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(1, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 196,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image[i]),
                            fit: BoxFit.fill,
                          )
                        )
                      ),
                      Container(
                        height: 54,
                        padding: EdgeInsets.only(left: 15,top: 8,right: 15,bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:50,
                                    child: Text(name[i],style: TextStyle(fontSize: 14,color: MyColor.myBlack),maxLines: 1,overflow: TextOverflow.ellipsis,)
                                ),
                                Container(
                                  height: 19,
                                    width: 19,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: MyColor.myLightGray175,
                                    ),
                                    child: Image.asset(icons[i]),)
                              ]
                            ),
                            Text(age[i],style: TextStyle(fontSize: 11,color: MyColor.myBlack),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                selected==i?Positioned(
                  top: 0,
                    right: 5,
                    child:Container(
                      decoration: BoxDecoration(
                        color:  Color.fromRGBO(26, 125, 125, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset("assets/images/Mask Group 18@2x.png"),
                    )
                ):Container()
              ],
            ),
          ),
        ),
      );
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double itemHeight = 255;
    final double itemWidth = (width-60)/2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined,color: Color.fromRGBO(119, 119, 119, 1),),
        ),
        title: Text("Vet Consultation",style: TextStyle(fontSize: 20,color: Color.fromRGBO(51, 51, 51, 1)),),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          width: width,
          child: Column(
            children: [
              Container(
                width: width,
                height: 1000,
                decoration: (
                    BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                )),
                child: Column(
                  children: [
                    Container(
                      width: width-56,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 26,),
                          Text("Hey Tommy,",style: TextStyle(fontSize: 20,color: Color.fromRGBO(68, 68, 68, 1)),),
                          SizedBox(height: 5,),
                          Text("Choose/Add the pet which need consultation",style: TextStyle(fontSize: 14,color:Color.fromRGBO(153, 153, 153, 1)),),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("My Pets",style: TextStyle(fontSize: 16),),
                              Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                  color:MyColor.myDarkCyan,
                                  boxShadow:  [
                                BoxShadow(
                                color: Color.fromRGBO(26, 125, 125, 0.6),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                                )
                                ],
                                ),
                                child:Image.asset("assets/images/add@2x.png",width: 15,) ,
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          childAspectRatio: (itemWidth / itemHeight),
                          controller: new ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: getProfileCard(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 132,
        height: 35,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PetConsultPage()));
          },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(19)),
              side: BorderSide(width: 2, color: MyColor.myDarkCyan),
            ),
        backgroundColor: MyColor.myWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Continue",style: TextStyle(fontSize: 14,color: MyColor.myLightBrightLightGreen91),),
            Image.asset("assets/images/Group 2941@2x.png",width: 24,),
          ],
        ),),
      )
    ,
    );
  }
}