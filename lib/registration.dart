//import 'dart:html';
//import 'storage_image.dart';
//import 'dart:html';
import 'dart:io';
import 'package:final_food/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference FOOD = FirebaseFirestore.instance.collection('FOOD');
  // late PlatformFile pickedFile;
  // late UploadTask? uploadTask;

  // Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if(result == null) return;
  //   setState(() {
  //     pickedFile = result.files.first;
  //   });
  // }
  //final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  late String profile = '';
  late String hotel;
  late String address;
  late String email;
  late String password;
  late String verify;
  String? imageLink;

  ///imageuplode

  void pickUploadImage() async {
    // final path = 'user_images/${pickedFile!.name}';
    //     final file = File(pickedFile!.path!);
    //     final ref = FirebaseStorage.instance.ref().child(path);
    //     uploadTask = ref.putFile(file);
    //
    //     final snapshot = await uploadTask!.whenComplete((){});
    //     final urlDownload = await snapshot.ref.getDownloadURL();
    //     print('Download Link: $urlDownload');
    final profile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref().child(uniqueFileName);
    UploadTask uploadTask = ref.putFile(File(profile!.path));
    uploadTask.whenComplete(() async {
      try{
        imageLink = await ref.getDownloadURL();
      }
      catch(e){
        print(e);
      }
      print(imageLink);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final Storage storage = Storage();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25.0, top: 55.0, right: 14.0),
              height: 110,
              width: double.infinity,
              color: Color(0xFF519259),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Anna Chatra",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 36),
                  )
                ],
              ),
            ),
            Container(
                height: 60,
                padding: EdgeInsets.only(top: 5, left: 25, right: 14),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Registration",
                      style: TextStyle(
                          //fontFamily: 'Montserrat',
                          color: Color(0xFF519259),
                          fontWeight: FontWeight.bold,
                          fontSize: 36),
                    ),
                  ],
                )),

              GestureDetector(
                onTap: () {
                  //selectFile;
                  pickUploadImage();
                  print('Image Stored'+imageLink.toString());
                },
                child: Container(
                  //  Image.file(imageFile, fit: BoxFit.cover),
                  height: 136,
                  width: 185,
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),


            SizedBox(height: 15.0),
            Container(
              width: double.infinity,
              // height: 350,
              padding: EdgeInsets.only(left: 28, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      hotel = value;
                    },
                    decoration:
                        InputDecoration(hintText: 'Organization / hotel name'),
                  ),
                  TextField(
                    keyboardType: TextInputType.streetAddress,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      address = value;
                    },
                    decoration: InputDecoration(hintText: 'Address'),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(hintText: 'e-mail'),
                  ),
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(hintText: 'password'),
                  ),
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      verify = value;
                    },
                    decoration: InputDecoration(hintText: 'verify password'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 21.0,
            ),
            Container(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      await users.add({'username': hotel,'profile':imageLink.toString()}).then(
                          (value) => print('data inserted'));
                      await FOOD.add({'address': address.toString(),'email': email.toString(),'hotel': hotel.toString(),'image': imageLink.toString()}).then((value) => print('registredd'));
                      //pickUploadImage();
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: TextButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(182, 39.25),
                        backgroundColor: Color(0xFFF0BB62),
                        padding: EdgeInsets.only(left: 30.0)),
                    // child: TextButton(onPressed: ()async{
                    //   final image = await FilePicker.platform.pickFiles(
                    //     allowMultiple: false,
                    //     type: FileType.custom,
                    //     allowedExtensions: ['png', 'jpg'],
                    //   );
                    //   if(image == null){
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(content: Text('No file selected'),
                    //         ),
                    //     );
                    //     return null;
                    //   }
                    //   final path = image.files.single.path!;
                    //   final fileName = image.files.single.name;
                    //
                    //   storage.uploadFile(path, fileName).then((value) => print('done'));
                    // },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Color(0xFF646464),
                          fontWeight: FontWeight.w800,
                          fontSize: 18.0),
                    ),
                  ),

                  // style: TextButton.styleFrom(
                  //     shape: StadiumBorder(),
                  //     backgroundColor: Color(0xFFF0BB62),
                  //     minimumSize: Size(182, 39.25)),
                ],
              ),
            ),
            //ImagePicker(),
          ],
        ),
      ),
    );
  }
}
//
// _getFromGallery() async {
//   PickedFile pickedFile = await ImagePicker().getImage(
//     source: ImageSource.gallery,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     File imageFile = File(pickedFile.path);
//   }
// }
//
//
// _getFromCamera() async {
//   XFile? pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.camera);
//   Image(image: ,
//    // source: ImageSource.camera,
//     //maxWidth: 1800,
//     //maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     setState(() {
//       var imageFile = File(pickedFile.path as List<Object>);
//     });
//   }
// }
