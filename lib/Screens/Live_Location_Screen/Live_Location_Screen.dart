// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class LiveLocationScreen extends StatelessWidget {
  LiveLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live location',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              '../assets/images/liveLocation.png',
              width: 130,
              height: 130,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "You aren't sharing live location in any chats",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Live location requires background location. You can manage this in your device settings.',
              style: TextStyle(
                color: grey,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
