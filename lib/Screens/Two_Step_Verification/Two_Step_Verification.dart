// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class TwoStepVerification extends StatelessWidget {
  TwoStepVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Two-step verification',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              '../assets/images/verify.png',
              width: 130,
              height: 130,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'For added security, enable two-step verification, which will require a PIN when registering your phone number with WhatsApp India again.',
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (builder) => ChangeNumberScreenTwo(),
                //   ),
                // );
              },
              child: Container(
                color: one,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,
                  ),
                  child: Text(
                    'ENABLE',
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
