// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class MyQRCodeScreen extends StatefulWidget {
  const MyQRCodeScreen({
    Key? key,
    required this.name,
    required this.avatar,
  }) : super(key: key);

  final String name;
  final String avatar;

  @override
  State<MyQRCodeScreen> createState() => _MyQRCodeScreenState();
}

class _MyQRCodeScreenState extends State<MyQRCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(widget.avatar),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.name),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'WhatsApp contact',
                    style: TextStyle(
                      color: grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    '../assets/images/qr.jpg',
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: Text(
              'Your QR code is private. If you share it with someone, they can scan it with their WhatsApp camera to add you as a contact.',
              style: TextStyle(
                color: grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
