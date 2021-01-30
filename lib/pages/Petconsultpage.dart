import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzapp/services/MyColorServices.dart';

class PetConsultPage extends StatefulWidget{
  @override
  _PetConsultPageState createState() => _PetConsultPageState();
}

class _PetConsultPageState extends State<PetConsultPage> {

  int selected=0;



  getoptions(containerwidth){
    List<Widget> data=new List<Widget>();
    data.add(
      Container(
          margin: EdgeInsets.only(top: 30,left: 28),
          child: Text("Select health Issue",style: TextStyle(fontSize: 16,color: Color.fromRGBO(68, 68, 68, 1)),)
      )
    );
    for(int i=0;i<5;i++)
      {
        data.add(
            GestureDetector(
              onTap: (){
                setState(() {
                  selected=i;
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 15,left: 28,right: 19),
                height: 97,
                width: containerwidth,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 7),
                      width: containerwidth-8,
                      height: 90,
                      decoration: BoxDecoration(
                        color: MyColor.myWhite,
                        borderRadius: BorderRadius.circular(17),
                        border: selected==i?Border.all(width: 2,color: MyColor.myDarkCyan):null
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30,right: 84),
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/NoPath - Copy (13)@2x.png")
                                )
                            ),
                          ),
                          Container(
                            child: Text("Behavior",style: TextStyle(color: MyColor.myBlack),),
                          )
                        ],
                      ),
                    ),
                    selected==i?Positioned(
                        top: 0,
                        right: 0,
                        child:Container(
                          decoration: BoxDecoration(
                            color:  Color.fromRGBO(26, 125, 125, 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset("assets/images/Mask Group 18@2x.png",width: 29,),
                        )
                    ):Container()
                  ],
                ),
              ),
            )
        );
      }
    data.add(
      Container(
        margin: EdgeInsets.only(top: 15,left: 28,right: 19),
        padding: EdgeInsets.only(top: 3,left: 15),
        width: containerwidth-8,
        height: 69,
        decoration: BoxDecoration(
          color: MyColor.myWhite,
          borderRadius: BorderRadius.circular(17),
        ),
        child: TextField(
            decoration: InputDecoration(
              hintText: "Describe the problem",
              hintStyle: TextStyle(color: Color.fromRGBO(153, 153, 153, 1),fontSize: 14),
              border: InputBorder.none
            ),
        ),
      )
    );
    return data;
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final containerwidth=MediaQuery.of(context).size.width - 55;
    // TODO: implement build
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
      body: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        width: width,
        child: Container(
          width: width,
          height: 1000,
          decoration: (
              BoxDecoration(
                color: Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              )),
         child: SingleChildScrollView(
           child: Container(
             margin: EdgeInsets.only(bottom: 100),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: getoptions(containerwidth)
             ),
           ),
         ),
        ),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        width: width-35,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 132,
                height: 35,
                child: FloatingActionButton(
                  heroTag: "btn2",
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(19)),
                  ),
                  backgroundColor: MyColor.myWhite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.arrow_back,size: 24,color: Color.fromRGBO(153, 153, 153, 1),),
                      Text("Back",style: TextStyle(fontSize: 14,color: Color.fromRGBO(153, 153, 153, 1)),),
                    ],
                  ),),
              ),
              SizedBox(
                width: 132,
                height: 35,
                child: FloatingActionButton(
                  heroTag: "btn1",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}