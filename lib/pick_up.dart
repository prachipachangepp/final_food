import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_food/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickUpScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pushNamed(context, HomeScreen.id);
          },
        ),
        //iconTheme: IconThemeData(),
        backgroundColor: Color(0xFF519259),
        title: //Image.asset('images/angle.png', fit: BoxFit.cover),
        //SizedBox(width: 5,),
        Text('Pick Ups',
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              )
          ),),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (BuildContext context, snapshot){
          return !snapshot.hasData? Center(child: CircularProgressIndicator(),):
         ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot data = snapshot.data
                ?.docs[index] as DocumentSnapshot<Object?>;
            return Container(
              margin: EdgeInsets.only(top: 8,
                  left: 6, right: 8),
              width: 397,
              height: 156,
              decoration: BoxDecoration(color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0.0, 1))
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Row(

                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 113,
                      height: 156,
                      decoration: BoxDecoration(
                          color: Color(0xFF99C85C5C), //(0xFFC85C5C),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 119,
                            // padding: EdgeInsets.all(10),
                            child: Text('Quantity', textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF646464),
                                  )
                              ),),
                          ),
                          SizedBox(height: 5),
                          Column(
                            children: [
                              Text('2',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Color(0xFF646464),
                                      fontSize: 36,
                                      fontWeight: FontWeight.w800,
                                    )
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 265,
                    height: 156,

                    //color: Colors.blueGrey,
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //padding: EdgeInsets.only(top: ),
                          height: 20,
                          width: 190,
                          //color: Colors.blue,
                          child: Row(
                            children: [
                              Container(
                                child: Text('Paneer Masala',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: Color(0xFF519259),
                                      fontWeight: FontWeight.w400
                                  ),),
                              ),
                              SizedBox(width: 79,),
                              Container(
                                height: 30,
                                width: 23,
                                child: Text('2',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF646464),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          //padding: EdgeInsets.only(top: ),
                          height: 20,
                          width: 190,
                          // color: Colors.blue,
                          child: Row(
                            children: [
                              Container(
                                child: Text('Chiken kabab',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: Color(0xFFC85C5C
                                      ),
                                      fontWeight: FontWeight.w400
                                  ),),
                              ),
                              SizedBox(width: 80,),
                              Container(
                                height: 30,
                                width: 23,
                                child: Text('10',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFF646464),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Container(
                              width: 119,
                              height: 22,
                              child: Text(
                                '9:10 ,today', textAlign: TextAlign.center,),
                            ),
                            SizedBox(width: 29.11,),
                            Container(
                              width: 109,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(onPressed: () {

                              },
                                style: TextButton.styleFrom(
                                    shape: StadiumBorder(),
                                    backgroundColor: Color(0xFFBB4848)),
                                child: Text(
                                  'Cancel', textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14)),),

                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  )
                ],

              ),
            );

          },
        );
    }
      ),





    );
  }
}

