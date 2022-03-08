// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CantReceiveMoney extends StatelessWidget {
  CantReceiveMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Can't receive money",
        ),
      ),
      body: Container(),
    );
  }
}
