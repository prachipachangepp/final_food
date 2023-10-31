import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUp extends StatefulWidget {
  PopUp({Key? key}) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  CollectionReference items = FirebaseFirestore.instance.collection('items');
  bool onChanged = true; //checkbox
  String? dish_name;
  int? quantity;
  final _textController = TextEditingController();
  String userPost = '';
  bool veg = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(21),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, offset: Offset(0, 1.1), blurRadius: 5)
                    ]),
                height: 669,
                width: 365,
                padding: EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 165,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Color(0xFFF0BB62),
                        // image: DecorationImage(image: AssetImage(Hotels[0]),fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(22),
                            topLeft: Radius.circular(22)),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 190.16,
                          child: Text(
                            'Vishal More',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF646464),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 36,
                          width: 257.34,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod ',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF646464),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Material(
                          child: Container(
                            width: 292,
                            height: 25,
                            child:
                            TextField(
                              // onTap: (){
                              //   _textController.clear();
                              // },
                              onChanged: (value) {

                                dish_name = value;
                                print('dish_name'+dish_name!);

                                //
                              },
                              controller: _textController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Enter dish name',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Material(
                          child: Container(
                            //padding: EdgeInsets.only(left: 13),
                            width: 292,
                            height: 25,
                            child: TextField(
                              onChanged: (value) {
                                // setState(() {
                                quantity = int.parse(value!);
                                print('quantity entered'+quantity.toString());
                                // });
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Quantity',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(0.0, 1.5),
                                )
                              ]),
                          width: 104.38,
                          height: 30,
                          // color: Colors.white70,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                userPost = _textController.text;
                              });

                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: StadiumBorder(),
                            ),
                            child: Text(
                              'Add',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF519259),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          height: 25,
                          width: 119.16,
                          //color: Colors.red,
                          child: Text(
                            'Food details',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF646464),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 25,
                          width: 70,
                          child: Text(
                            'Quantity',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF646464),
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Container(
                          height: 30,
                          width: 30,
                          color: Colors.cyan,

                          //child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //children: [
                          child: Material(
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset('images/delete.png'),
                              color: Colors.transparent,
                            ),
                          )),
                      //SizedBox(width: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 15,
                            width: 190,
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              'Paneer masala',
                              style: GoogleFonts.montserrat(
                                  decoration: TextDecoration.none,
                                  textStyle: TextStyle(
                                    color: Color(0xFF519259),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            width: 23,
                            height: 30,
                            //color: Colors.grey,
                            child: Text(
                              // '$quantity',
                              '2',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Color(0xFF646464),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Container(
                          height: 30,
                          width: 30,
                          color: Colors.cyan,

                          //child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //children: [
                          child: Material(
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset('images/delete.png'),
                              color: Colors.transparent,
                            ),
                          )),
                      //SizedBox(width: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 15,
                            width: 190,
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              'Chicken Kabab',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Color(0xFF99C85C5C),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            width: 23,
                            height: 30,
                            //color: Colors.grey,
                            child: Text(
                              '10',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Color(0xFF646464),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 20,
                          width: 20,
                          child: Material(
                            child: Checkbox(
                              value: veg,
                              //value: veg,
                              onChanged: (value) {
                                //value==false ?value=false:value=true;
                                //veg=value;
                                ///newcmt
                                //  if(value!){
                                //    veg=false;
                                //  }
                                //  else{
                                //    veg=true;
                                //  }
                                //  print(veg);
                                setState(() {

                                  veg = value!;
                                  if(veg != false){
                                    print('true'+veg.toString());
                                  }
                                  else{
                                    print('yup'+veg.toString());
                                  }
                                });
                              },
                            ),
                          ),

                        ),
                        //),

                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            'Non-veg',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFBB4848),
                                  decoration: TextDecoration.none,
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 105,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xFFF0BB62)),
                            onPressed: () async{
                              //await orders.add({'veg': veg.toString()}).then((value) => print('Add'));
                              await items.add({
                                'dish_name': dish_name,
                                'quantity': quantity,
                              }).then((value) => print('items entered'));
                              Navigator.pushNamed(context, HomeScreen.id);
                            },
                            child: Text(
                              'Donate',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),

      );

  }
}
