import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_food/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickUp extends StatefulWidget {
  PickUp({Key? key}) : super(key: key);

  @override
  State<PickUp> createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {

  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  bool veg = true;
  bool checkBoxValue = true;
  String? sender;
  bool? orderAvalabel = true;

  List Hotels = [
    "images/Rectangle.png",
    "images/Hotel_a.png",
    "images/Hotel_b.png",
    "images/Hotel_c.png",
    "images/Hotel_d.png",
  ];
  List<String> hotelName = [
    'Saloni Pardeshi',
    'Hotel Green Leaf',
    'Hotel Marina',
    'Hotel Pacific',
    'Hotel The Park',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///pickup code
          Container(
            padding: EdgeInsets.only(top: 11,right: 12,left: 12),
            height: 669,
            width: 356,

            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(22)),
            //padding: EdgeInsets.all(20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  child: Container(
                    height: 165,
                    width: 330,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(Hotels[1]),fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(22), topLeft: Radius.circular(22)),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Container(
                      width: 190.16,
                      height: 30,
                      child: Text(hotelName[0],
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xFF646464),),
                        ),),
                    ),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Container(
                        width:257.34,
                        height: 36,
                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFF646464)),
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 190.16,
                      height: 30,
                      child: Text('Food details',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF646464),
                        ),),
                    ),
                    SizedBox(
                      width: 30.84,
                    ),
                    Container(
                      height: 30,
                      width: 65,
                      //color: Colors.lightBlueAccent,
                      child: Text('Quantity',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF646464),
                        ),),
                    )
                  ],),
                SizedBox(height: 17,),
                Row(children: [
                  Container(
                    height: 20,
                    width: 190,
                    child: Text('Paneer Masala',
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Color(0xFF519259),
                          fontWeight: FontWeight.w400
                      ),),
                  ),
                  SizedBox(width: 50,),
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
                SizedBox(height: 26,),


                Row(
                  children: [
                    Container(
                      width: 190,
                      height: 20,
                      child: Text('Chiken Kabab',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFC85C5C),
                        ),),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      width:23,
                      height: 30,
                      child: Text('10',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF646464),
                        ),),
                    ),

                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 190.16,
                      child: Text('Available',
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                        ),),
                    ),
                    SizedBox(width: 50,),


                    // Container(
                    // width: 30,
                    //height: 30,
                    Row(
                      children: [
                        checkBoxAvailable(),

                      ],
                    )
                    // )
                    // Scaffold(
                    //   body: Checkbox(
                    //       value: true,
                    //       checkColor: Colors.lightBlueAccent,
                    //       activeColor: Colors.lightBlueAccent,
                    //       onChanged: (checkboxState) async {
                    //       },
                    //       // onChanged: (){
                    //       //       setState(() {
                    //       //
                    //       //       });
                    //       // }
                    //     ),
                    // ),
                    //
                  ],
                ),
                SizedBox(height: 115,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5,offset: Offset(0.0,1.5),)]),
                      width: 104.38,
                      height: 30,
                      // color: Colors.white70,
                      child: TextButton(onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },

                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: StadiumBorder(),

                        ),
                        child: Text('Cancle',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFF0BB62),
                          ),),),
                    ),
                    SizedBox(width: 25,),
                    Container(
                      width: 104.38,
                      height: 30,
                      child: TextButton(onPressed: () async{
                        /// showDilog Acceept Request
                        await orders.add({'sender': hotelName[0].toString(),'order_availability':orderAvalabel.toString(),'veg':veg.toString()}).then((value) => print('Added'));
                        //Navigator.pushNamed(context, HomeScreen.id);
                        showDonePopup(context);
                      },
                        style: TextButton.styleFrom(
                            shadowColor: Colors.grey,
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xFFF0BB62)),

                        child: Text('Pick up',
                          style: TextStyle(
                            color: Colors.white,
                          ),),),

                    )
                  ],
                )
              ],
            ),
          )

        ],);
      // ),


  }

  ///confirmation page
  Future<void> showDonePopup(BuildContext context)async {
    return await showDialog(context: context,
      builder: (context) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 11,right: 12,left: 12),
                height: 669,
                width: 356,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 165,
                        width: 332,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(Hotels[0]),fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(22), topLeft: Radius.circular(22),),)
                    ),
                    SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          //padding: EdgeInsets.only(top: 11,right: 12,left: 10),
                          height: 30,
                          width: 190.16,
                          child: Text(hotelName[0],
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color(0xFF646464),),
                            ),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 36,
                          width: 257.34,
                          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF646464),
                                  )
                              )),
                        )
                      ],
                    ),
                    SizedBox(height: 80,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 316,
                          child: Text('Your Request Accepted !',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF519259),
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 316,
                          child: Text('Please do collect the parcel from counter',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF519259),
                                )
                            ),),
                        ),
                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          height: 30,
                          width: 104.38,

                          decoration: BoxDecoration(color: Color(0xFFF0BB62),borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(
                            color: Colors.grey, blurRadius: 5, offset: Offset(0.0,1.1),
                          )]),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                shadowColor: Colors.grey,
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xFFF0BB62)),
                            onPressed: () {
                              Navigator.pushNamed(context, HomeScreen.id);

                            },
                            child: Text('Done',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    );

  }
}
///checkbox
class checkBoxAvailable extends StatefulWidget {
  checkBoxAvailable({Key? key}) : super(key: key);

  @override
  State<checkBoxAvailable> createState() => _checkBoxAvailableState();
}

class _checkBoxAvailableState extends State<checkBoxAvailable> {
  bool? orderAvalabel = true;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Checkbox(value: orderAvalabel, onChanged: (bool? value) {
          setState(() {
          orderAvalabel = value!;
          if(orderAvalabel != false){
            print('true' + orderAvalabel.toString());
          }
          else{
            print('false' + orderAvalabel.toString());
          }
          });
        },)
    );
  }
}

