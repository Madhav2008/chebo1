// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names, prefer_const_constructors_in_immutables

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
  State<ViewChatPhoto> createState() {
    return _ViewChatPhotoState();
  }
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.senderName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.time,
              style: TextStyle(
                fontSize: 15,
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
                    Icons.star_border,
                    color: white,
                  )) {
                setState(() {
                  star = Icon(
                    Icons.star,
                    color: white,
                  );
                });
              } else {
                setState(() {
                  star = Icon(
                    Icons.star_border,
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
          ],
        ),
      ),
    );
  }
}
