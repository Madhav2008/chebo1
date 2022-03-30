// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names, prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class ViewChatPhoto extends StatefulWidget {
  ViewChatPhoto({
    Key? key,
    required this.path,
    required this.senderName,
    required this.time,
  }) : super(key: key);

  final String path;
  final String senderName;
  final String time;

  @override
  State<ViewChatPhoto> createState() => _ViewChatPhotoState();
}

class _ViewChatPhotoState extends State<ViewChatPhoto> {
  Icon star = Icon(
    Icons.star_border,
    color: white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        title: Column(
          children: [
            Text(
              widget.senderName,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.time,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: star,
            onPressed: () {
              if (star ==
                  Icon(
                    Icons.star,
                    color: white,
                  )) {
                setState(() {
                  star = Icon(
                    Icons.star,
                    color: white,
                  );
                });
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.mobile_screen_share_rounded,
              size: 27,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 27,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(widget.path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: black,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  style: TextStyle(
                    color: white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add Caption....",
                    prefixIcon: Icon(
                      Icons.add_photo_alternate,
                      color: white,
                      size: 27,
                    ),
                    hintStyle: TextStyle(
                      color: white,
                      fontSize: 17,
                    ),
                    suffixIcon: CircleAvatar(
                      radius: 27,
                      backgroundColor: one,
                      child: Icon(
                        Icons.check,
                        color: white,
                        size: 27,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
