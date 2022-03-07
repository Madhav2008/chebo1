// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CantSendMoney extends StatelessWidget {
  const CantSendMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Can't send money",
        ),
      ),
      body: Container(),
    );
  }
}
