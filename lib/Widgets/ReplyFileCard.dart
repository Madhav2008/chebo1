// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:flutter/material.dart';

class ReplyFileCard extends StatelessWidget {
  ReplyFileCard({
    Key? key,
    required this.path,
    required this.fileColor,
  }) : super(key: key);

  final String path;
  final Color fileColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: fileColor,
          ),
          child: Card(
            margin: EdgeInsets.all(
              3,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.file(
              File(path),
            ),
          ),
        ),
      ),
    );
  }
}
