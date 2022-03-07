// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/images/1.png',
              width: MediaQuery.of(context).size.width - 300,
              height: MediaQuery.of(context).size.width - 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'No Connection',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
