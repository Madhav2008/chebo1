// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class ViewProfilePhoto extends StatelessWidget {
  const ViewProfilePhoto({
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
        // backgroundColor: black,
        title: Text(
          name,
        ),
      ),
      body: Center(
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
    );
  }
}
