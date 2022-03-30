// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Login_Screen/Login_Screen.dart';
import 'package:whatsapp/Screens/Navigation/Navigation.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Welcome to WhatsApp India',
                style: TextStyle(
                  fontSize: 22,
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
              '../assets/images/Landing(WI).png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width - 100,
              color: secondary,
            ),
          ),
          Expanded(
            child: Container(
              height: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Read our ',
                    style: TextStyle(
                      color: grey,
                      fontSize: 17,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy. ',
                    style: TextStyle(
                      color: blue,
                      fontSize: 17,
                    ),
                  ),
                  TextSpan(
                    text: 'Tap "Agree and continue" to accept the ',
                    style: TextStyle(
                      color: grey,
                      fontSize: 17,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms of service.',
                    style: TextStyle(
                      color: blue,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                    builder: (BuildContext context) {
                      return NavigationScreen(
                  cameras: cameras,
                  name: 'Madhav Arora',
                  avatar:
                      'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
                  phoneno: '9999348666',
                  countryCode: '+91',
                  about: '👋🏻 Hey! there I am using WhatsApp India.',
                );
                    },
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: one,
                    boxShadow: [
                      BoxShadow(
                        color: black,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 12,
                    ),
                    child: Text(
                      'AGREE AND CONTINUE',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 20,
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
          Text(
            'from',
            style: TextStyle(
              color: grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '../assets/images/meta.png',
                width: 22,
                height: 22,
                color: secondary,
              ),
              Text(
                'Meta',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
