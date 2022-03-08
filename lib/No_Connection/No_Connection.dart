// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'No Internet Connection',
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
