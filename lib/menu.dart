///Side Drawer code

import 'package:final_food/login.dart';
import 'package:final_food/pick_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'donations.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
            DrawerHeader(child: Padding(
              padding: EdgeInsets.only(top: 110.0),
              child: Text('Vishal More',
              style:GoogleFonts.montserrat(textStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Colors.white
              ),
              ),
            ),),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey,blurRadius:6,offset: Offset(0, 2.0))],
              color: Color(0xFFF0BB62),
            ),
            ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DonationScreen()));
            },
            title: Text('View Donations',
            style: GoogleFonts.montserrat(textStyle: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
            ),

          ),),
          ListTile(
            title: Text('Pick up Orders',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
              ),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PickUpScreen()));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4),
            leading: SizedBox(
              height: 20.0,
              width: 20.0,
              child: Image.asset('images/Vector.png',
              //fit: BoxFit.cover,
          ),
            ),
            title: Text('Log Out',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
              ),),
            onTap: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),

        ],
      ),
    );
  }
}













