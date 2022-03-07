// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CantReceiveMoney extends StatelessWidget {
  const CantReceiveMoney({Key? key}) : super(key: key);

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
