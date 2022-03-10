// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Landing_Page/Landing_Page.dart';

class DeleteMyAccountThree extends StatefulWidget {
  const DeleteMyAccountThree({Key? key}) : super(key: key);

  @override
  State<DeleteMyAccountThree> createState() => _DeleteMyAccountThreeState();
}

class _DeleteMyAccountThreeState extends State<DeleteMyAccountThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete my account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              '../assets/images/alert.png',
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Proceed to delete your account?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Deleting your account is permanent. Your data cannot be recovered if you reactive your WhatsApp account in future.',
              style: TextStyle(
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
                    builder: (builder) => LandingPage(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      'DELETE MY ACCOUNT',
                      style: TextStyle(
                        fontSize: 15,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
