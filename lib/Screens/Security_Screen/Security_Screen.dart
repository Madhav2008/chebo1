// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Security',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Icon(
                Icons.security,
                size: 70,
              ),
              Positioned(
                top: 100,
                child: Icon(Icons.lock),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
