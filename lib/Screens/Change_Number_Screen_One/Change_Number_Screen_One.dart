// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Change_Number_Screen_Two/Change_Number_Screen_Two.dart';

class ChangeNumberScreenOne extends StatelessWidget {
  ChangeNumberScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change number',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              '../assets/images/changeNo.png',
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Changing your phone number will migrate your phone info, groups & settings.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Before proceeding, please confirm that you are able to receive SMS and calls at your new number.',
              style: TextStyle(
                color: grey,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'If you have both a new phone & a new number, first change your number on your old phone.',
              style: TextStyle(
                color: grey,
                fontSize: 17,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => ChangeNumberScreenTwo(),
                  ),
                );
              },
              child: Container(
                color: one,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,
                  ),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 17,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
