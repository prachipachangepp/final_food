import 'dart:core';

//import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_food/donate_screen.dart';
import 'package:final_food/pickup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'donate_screen.dart';
import 'menu.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  //CollectionReference

  // final _textController = TextEditingController();
  // String userPost = '';

  // List Hotels = [
  //   "images/Rectangle.png",
  //   "images/Hotel_a.png",
  //   "images/Hotel_b.png",
  //   "images/Hotel_c.png",
  //   "images/Hotel_d.png",
  // ];
  // List<String> hotelName = [
  //   'vishal more',
  //   'Hotel Green Leaf',
  //   'Hotel Marina',
  //   'Hotel Pacific',
  //   'Hotel The Park',
  // ];

  //get builder => null;
  ///pickup
  // Future<void> showInfoPopup(BuildContext context)async {
  //
  // bool onChanged = false;
  // return await showDialog(context: context,
  //   builder: (context) =>
  //   //wrap with container
  //   //Container(
  //     //child:
  //   Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         ///pickup code
  //         Container(
  //           padding: EdgeInsets.only(top: 11,right: 12,left: 12),
  //           height: 669,
  //           width: 356,
  //
  //           decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(22)),
  //           //padding: EdgeInsets.all(20),
  //
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Material(
  //                 child: Container(
  //                   height: 165,
  //                   width: 330,
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(image: AssetImage(Hotels[0]),fit: BoxFit.cover),
  //                     borderRadius: BorderRadius.only(topRight: Radius.circular(22), topLeft: Radius.circular(22)),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 15,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //
  //                 Container(
  //                   width: 190.16,
  //                   height: 30,
  //                     child: Text('Hotel Green Leaf ',
  //                       style: GoogleFonts.montserrat(
  //                         textStyle: TextStyle(
  //                             fontWeight: FontWeight.w700,
  //                             fontSize: 18,
  //                         color: Color(0xFF646464),),
  //                       ),),
  //                 ),
  //               ],),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //
  //                   Container(
  //                     width:257.34,
  //                       height: 36,
  //                       child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
  //                           style: GoogleFonts.montserrat(
  //                             textStyle: TextStyle(
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 12,
  //                             color: Color(0xFF646464)),
  //                           ),
  //                       )
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 15,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                 Container(
  //                   width: 190.16,
  //                   height: 30,
  //                   child: Text('Food details',
  //                   style: GoogleFonts.montserrat(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w600,
  //                     color: Color(0xFF646464),
  //                   ),),
  //                 ),
  //                   SizedBox(
  //                     width: 30.84,
  //                   ),
  //                   Container(
  //                     height: 30,
  //                     width: 65,
  //                     //color: Colors.lightBlueAccent,
  //                     child: Text('Quantity',
  //                     style: GoogleFonts.montserrat(
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w600,
  //                       color: Color(0xFF646464),
  //                     ),),
  //                   )
  //               ],),
  //               SizedBox(height: 17,),
  //               Row(children: [
  //                 Container(
  //                   height: 20,
  //                   width: 190,
  //                   child: Text('Paneer Masala',
  //                   style: GoogleFonts.montserrat(
  //                     fontSize: 12,
  //                     color: Color(0xFF519259),
  //                     fontWeight: FontWeight.w400
  //                   ),),
  //                 ),
  //                 SizedBox(width: 50,),
  //                 Container(
  //                   height: 30,
  //                   width: 23,
  //                   child: Text('2',
  //                   style: GoogleFonts.montserrat(
  //                     color: Color(0xFF646464),
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w700,
  //                   ),),
  //                 ),
  //           ],
  //         ),
  //                SizedBox(height: 26,),
  //
  //
  //                 Row(
  //                   children: [
  //                     Container(
  //                       width: 190,
  //                       height: 20,
  //                       child: Text('Chiken Kabab',
  //                       style: GoogleFonts.montserrat(
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.w400,
  //                         color: Color(0xFFC85C5C),
  //                       ),),
  //                     ),
  //                     SizedBox(width: 50,),
  //                     Container(
  //                       width:23,
  //                       height: 30,
  //                       child: Text('10',
  //                       style: GoogleFonts.montserrat(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w700,
  //                         color: Color(0xFF646464),
  //                       ),),
  //                     ),
  //
  //                   ],
  //                 ),
  //                 SizedBox(height: 50,),
  //                 Row(
  //                   children: [
  //                     Container(
  //                       height: 30,
  //                       width: 190.16,
  //                       child: Text('Available',
  //                       style: GoogleFonts.montserrat(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w700
  //                       ),),
  //                     ),
  //                    SizedBox(width: 50,),
  //
  //
  //                   // Container(
  //                     // width: 30,
  //                      //height: 30,
  //                      Row(
  //                        children: [
  //                          Material(
  //                             /// ChechBox code
  //                            child: Checkbox(value: orderAvalabel, onChanged: (bool? value) {
  //                              orderAvalabel = value!;
  //                              if(orderAvalabel != false){
  //                                print('true' + orderAvalabel.toString());
  //                              }
  //                              else{
  //                                print('false' + orderAvalabel.toString());
  //                              }
  //                            },)
  // ),
  //                        ],
  //                      )
  //                   // )
  //                       // Scaffold(
  //                       //   body: Checkbox(
  //                       //       value: true,
  //                       //       checkColor: Colors.lightBlueAccent,
  //                       //       activeColor: Colors.lightBlueAccent,
  //                       //       onChanged: (checkboxState) async {
  //                       //       },
  //                       //       // onChanged: (){
  //                       //       //       setState(() {
  //                       //       //
  //                       //       //       });
  //                       //       // }
  //                       //     ),
  //                       // ),
  //                       //
  //                   ],
  //                 ),
  //                 SizedBox(height: 115,),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                   Container(
  //                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
  //                         boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5,offset: Offset(0.0,1.5),)]),
  //                     width: 104.38,
  //                     height: 30,
  //                    // color: Colors.white70,
  //                     child: TextButton(onPressed: () {
  //                       Navigator.pushNamed(context, HomeScreen.id);
  //                     },
  //
  //                       style: TextButton.styleFrom(
  //                         backgroundColor: Colors.white,
  //                         shape: StadiumBorder(),
  //
  //                       ),
  //                       child: Text('Cancle',
  //                       textAlign: TextAlign.center,
  //                       style: GoogleFonts.montserrat(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w700,
  //                         color: Color(0xFFF0BB62),
  //                       ),),),
  //                   ),
  //                   SizedBox(width: 25,),
  //                   Container(
  //                     width: 104.38,
  //                     height: 30,
  //                     child: TextButton(onPressed: () async{
  //                       /// showDilog Acceept Request
  //                       await orders.add({'sender': hotelName[0].toString(),'order_availability':orderAvalabel.toString(),'veg':veg.toString()}).then((value) => print('Added'));
  //                       showDonePopup(context);
  //                     },
  //                       style: TextButton.styleFrom(
  //                           shadowColor: Colors.grey,
  //                           shape: StadiumBorder(),
  //                           backgroundColor: Color(0xFFF0BB62)),
  //
  //                       child: Text('Pick up',
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                       ),),),
  //
  //                   )
  //                 ],
  //               )
  //             ],
  //           ),
  //         )
  //
  //     ],),
  //  // ),
  //   );
  //}

  @override

  ///AppBar
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFF519259),
          actions: [
            Row(
              children: [
                Text(
                  'Donate',
                  style: GoogleFonts.montserrat(),
                ),
              ],
            ),
            IconButton(
                icon: Image.asset('images/Donate.png'),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          Padding(padding: EdgeInsets.all(20), child: PopUp()));
                }),
          ],
          title: Text(
            'Anna Chatra',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
          ),
        ),

        ///ListView Code homeScreen
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (BuildContext context, snapshot) {
              return !snapshot.hasData
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data?.docs[index]
                            as DocumentSnapshot<Object?>;

                        return Container(
                            margin: EdgeInsets.all(5),
                            width: 396.87,
                            height: 287,
                            padding: EdgeInsets.only(left: 2.0, top: 5.0),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(189, 189, 189, 100),
                                    blurRadius: 10.0,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    child: Image.network(
                                      data['profile'],
                                      width: double.infinity,
                                      height: 176,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 112.65,
                                          height: 110,
                                          decoration: BoxDecoration(
                                              color: (index % 2 == 0)
                                                  ? Color(0xFF99B2EA70)
                                                  : Color(0xFF99C85C5C),
                                              // color: Color(0xFFB2EA70),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20))),
                                          child: Column(children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text('Quantity',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xFF646464),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text('2',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle: TextStyle(
                                                            fontSize: 36,
                                                            color: Color(
                                                                0xFF646464),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ])),
                                      // SizedBox(
                                      //   width: 1,
                                      // ),
                                      Expanded(
                                          child: Container(
                                        width: 275,
                                        height: 125,
                                        color: Colors.white,
                                        padding: EdgeInsets.only(
                                            left: 14.47, top: 7),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              height: 28,
                                              width: 180,
                                              padding: EdgeInsets.only(top: 3),
                                              child: Text(data['username'],
                                                  style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xFF646464),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )),
                                            ),
                                            Container(
                                              height: 34,
                                              width: 257,
                                              color: Colors.transparent,
                                              padding: EdgeInsets.only(top: 2),
                                              child: Text(
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod ',
                                                style: TextStyle(
                                                    color: Color(0xFF646464),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.0,
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 167, bottom: 2),
                                                height: 35,
                                                width: 260,
                                                color: Colors.transparent,
                                                child: TextButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20),
                                                                  child:
                                                                      PickUp()));
                                                      //wrap with container
                                                      //Container(
                                                      //child:

                                                      // showInfoPopup(context);
                                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>AlertDialog()));
                                                      //Navigator.push(context, MaterialPageRoute(builder:(context) => Popup()));
                                                    },
                                                    style: TextButton.styleFrom(
                                                        shadowColor:
                                                            Colors.grey,
                                                        shape: StadiumBorder(),
                                                        backgroundColor:
                                                            Color(0xFFF0BB62)),
                                                    child: Text("View",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 14),
                                                        ))))
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      });
            }));
  }
}
