// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Landing_Page/Landing_Page.dart';
import 'package:whatsapp/Theme/Provider/Theme_Provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(
        seconds: 1,
      ),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final logo = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? '../assets/images/logo1.png'
        : '../assets/images/logo.png';
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              width: 85,
              height: 85,
            ),
            SizedBox(
              height: 250,
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
                  color: secondary,
                  width: 30,
                  height: 30,
                ),
                Text(
                  'Meta',
                  style: TextStyle(
                    color: secondary,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
