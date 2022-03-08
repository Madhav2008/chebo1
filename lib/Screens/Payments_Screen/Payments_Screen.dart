// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class PaymentsScreen extends StatelessWidget {
  PaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close),
        title: Text('Payments'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '../assets/images/.',
          ),
          SizedBox(
            height: 50,
          ),
          Text('data'),
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
    );
  }
}
