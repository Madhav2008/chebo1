// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/Widgets/Circular_Progress.dart';
// import 'package:whatsapp/Models/Chat_Model.dart';

class SelectAccountScreen extends StatefulWidget {
  SelectAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectAccountScreen> createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences preferences;

  bool isLoading = false;
  bool isSignedIn = false;

  late User currentUser;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    // ChatModel sourceChat;
    return Scaffold(
      body: GestureDetector(
        onTap: controlSignIn,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 270,
              height: 65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    '../assets/images/google_signin_button.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                10.0,
              ),
              child: loadingWhatsAppIndia(),
            ),
          ],
        ),
      ),
      // ListView.builder(
      //   itemCount: dummyData.length,
      //   itemBuilder: (
      //     context,
      //     index,
      //   ) {
      //     return InkWell(
      //       onTap: () {
      //         sourceChat = dummyData.removeAt(index);
      //         Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(
      //             builder: (builder) => NavigationScreen(
      //               cameras: [],
      //               name: dummyData[index].name,
      //               avatar: dummyData[index].avatarUrl,
      //               phoneno: dummyData[index].phoneno,
      //               countryCode: '+91',
      //               about: dummyData[index].about,
      //               sourceChat: sourceChat,
      //               chatModels: dummyData,
      //             ),
      //           ),
      //         );
      //       },
      //       child: ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(
      //             Icons.person,
      //             color: white,
      //             size: 30,
      //           ),
      //           backgroundColor: one,
      //         ),
      //         title: Text(dummyData[index].name),
      //       ),
      //     );
      //   },
      // ),
    );
  }

  Future<Null> controlSignIn() async {
    setState(() {
      isLoading = true;
    });
  }
}
