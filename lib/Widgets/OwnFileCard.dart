// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OwnFileCard extends StatelessWidget {
  const OwnFileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
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
          ),
        ),
      ),
    );
  }
}
