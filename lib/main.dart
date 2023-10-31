import 'package:final_food/home_screen.dart';
import 'package:final_food/registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
//import 'options.dart';
void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
 // var DefaultFirebaseOptions;
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AnnaChatra());
}

class AnnaChatra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          print(snapshot.error);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold());
        }
        else{
          return MaterialApp(
            initialRoute: LoginScreen.id,
            debugShowCheckedModeBanner: false,
            routes: {
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              HomeScreen.id: (context) => HomeScreen(),
            },
          );
        }
      },

      );
  }
}
