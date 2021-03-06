// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class ViewProfilePhoto extends StatelessWidget {
  ViewProfilePhoto({
    Key? key,
    required this.name,
    required this.avatar,
  }) : super(key: key);

  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
        ),
      ),
      body: Center(
        child: Container(
          color: grey,
          child: InteractiveViewer(
            panEnabled: false,
            boundaryMargin: EdgeInsets.all(100),
            minScale: 1,
            maxScale: 2,
            child: Image.network(
              avatar,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
