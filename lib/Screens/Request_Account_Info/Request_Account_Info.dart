// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class RequestAccountInfo extends StatefulWidget {
  RequestAccountInfo({Key? key}) : super(key: key);

  @override
  State<RequestAccountInfo> createState() => _RequestAccountInfoState();
}

class _RequestAccountInfoState extends State<RequestAccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request account info',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              '../assets/images/accountInfo.png',
              width: 130,
              height: 130,
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Create a report of your WhatsApp account information and settings, which you can access or port to another app. This report does not include your messages. ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: grey,
                    ),
                  ),
                  TextSpan(
                    text: 'Learn more.',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.feed,
                size: 25,
                color: grey,
              ),
              title: Text(
                'Request report',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
