//import 'dart:html';

import 'package:final_food/registration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
//import 'registration.dart';
class LoginScreen extends StatefulWidget {
  static String id = 'login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    late String email;
    late String password;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Color(0xFF519259),
                height: 300.0,
                width: double.infinity,
                padding: EdgeInsets.only(left: 19.0, top: 250.0),
                child: Text(
                  'Anna Chatra',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 36.0,
                      color: Colors.white),
                )
                // ],
                ),

            Container(
              height: 300.0,
              width: double.infinity,
              color: Colors.white,
              // padding: EdgeInsets,
              padding: EdgeInsets.only(top: 10.0, left: 19.0, right: 19.0),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      height: 50,
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF519259)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(hintText: 'e-mail'),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'password',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(

                            //padding: EdgeInsets.only(top:15.0,left: 234.0,),
                            child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationScreen()));
                          },
                          child: Text(
                            'Not Registerd?',
                            style: TextStyle(
                                color: Color(0xFF4ABEFF),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 80,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(182, 39.25),
                        backgroundColor: Color(0xFFF0BB62),
                        padding: EdgeInsets.only(left: 30.0)),
                    child: (Text(
                      'Log In        ',
                      style: TextStyle(
                          color: Color(0xFF646464),
                          fontWeight: FontWeight.w800,
                          fontSize: 18.0),
                    )),
                    onPressed: () async {
                      try {
                        var user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
