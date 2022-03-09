// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class PaymentsScreen extends StatelessWidget {
  PaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Payments'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ListTile(
            //   leading: Icon(
            //     Icons.close,
            //   ),
            //   title: Text('Payments'),
            // ),
            Image.asset(
              '../assets/images/.',
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Send and receive money securely, right where you chat',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: one,
                size: 35,
              ),
              title: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '3 Crore+ people ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                    TextSpan(
                      text: 'are already using WhatsApp payments.',
                      style: TextStyle(
                        fontSize: 20,
                        color: grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
              ),
            ),
            Container(
              color: one,
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              child: Center(
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                    fontSize: 20,
                    color: white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              '../assets/images/upi.png',
              width: 70,
              height: 70,
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
