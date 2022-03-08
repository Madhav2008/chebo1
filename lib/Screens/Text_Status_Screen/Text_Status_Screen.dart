// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'dart:math' as math;

class TextStatusScreen extends StatelessWidget {
  TextStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _statusController = TextEditingController();
    var color = Color(
      (math.Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withOpacity(1.0);
    return Scaffold(
      body: Container(
        color: color,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _statusController,
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Text',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
