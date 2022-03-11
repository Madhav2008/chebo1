// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class DefaultMessageTimer extends StatefulWidget {
  const DefaultMessageTimer({Key? key}) : super(key: key);

  @override
  State<DefaultMessageTimer> createState() => _DefaultMessageTimerState();
}

class _DefaultMessageTimerState extends State<DefaultMessageTimer> {
  final List timer = [
    {'name': '24 hours'},
    {'name': '7 days'},
    {'name': '90 days'},
    {'name': 'Off'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Default message timer',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              '../assets/images/messageTimer.png',
              width: 200,
              height: 200,
            ),
            Text(
              'Start new chats with disappearing messages',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // updateLanguage(locale[index]['locale']);
                    },
                    child: Text(
                      timer[index]['name'],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: grey,
                  thickness: 1,
                );
              },
              itemCount: timer.length,
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        "When enabled, all new individual chats will start with disappearing messages set to the selected duration. This setting will not affect your existing chats. ",
                    style: TextStyle(
                      fontSize: 17,
                      color: grey,
                    ),
                  ),
                  TextSpan(
                    text: 'Learn more',
                    style: TextStyle(
                      fontSize: 17,
                      color: blue,
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Container(
            //     height: 1,
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //     color: one,
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(
            //         horizontal: 20.0,
            //         vertical: 15.0,
            //       ),
            //       child: Text(
            //         'DONE',
            //         style: TextStyle(
            //           fontSize: 17,
            //           color: white,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
