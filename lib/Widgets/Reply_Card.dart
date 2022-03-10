// ignore_for_file: prefer_const_constructors, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class ReplyCard extends StatelessWidget {
  ReplyCard({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);
  final Color color;
  final Color text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          color: color,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 50,
                  top: 5,
                  bottom: 20,
                ),
                child: Text(
                  'Kya Haal h ?',
                  style: TextStyle(
                    fontSize: 16,
                    color: text,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  '9:50AM',
                  style: TextStyle(
                    fontSize: 13,
                    color: grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
