// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Login_Screen/Login_Screen.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Welcome to WhatsApp',
                style: TextStyle(
                  fontSize: 25  ,
                  color: one,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 13,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              '../assets/images/first.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              height: 10,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Tap "Agree and Continue" to accept the ',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: 'WhatsApp',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: ' Terms of Service and Privacy Policy',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          // Text(
          //   'WhatsApp',
          //   style: TextStyle(
          //     color: Colors.blue,
          //     fontSize: 17,
          //   ),
          // ),
          // Text(
          //   ' Terms of Service and Privacy Policy',
          //   style: TextStyle(
          //     color: Colors.blue,
          //     fontSize: 17,
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen(
                      country: "India",
                      countryCode: "+91",
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: secondary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 150.0,
                        spreadRadius: 5.0,
                        offset: Offset(
                          0,
                          10,
                        ),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 12,
                    ),
                    child: Text(
                      'AGREE AND CONTINUE',
                      style: TextStyle(
                        fontSize: 20,
                        color: white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
