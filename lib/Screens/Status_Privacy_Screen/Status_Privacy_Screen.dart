// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class StatusPrivacyScreen extends StatefulWidget {
  const StatusPrivacyScreen({Key? key}) : super(key: key);

  @override
  State<StatusPrivacyScreen> createState() => _StatusPrivacyScreenState();
}

class _StatusPrivacyScreenState extends State<StatusPrivacyScreen> {
  final List status = [
    {'name': 'My contacts'},
    {'name': 'My contacts except...'},
    {'name': 'Only share with...'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Status privacy',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who can see my status updates',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: grey,
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
                      status[index]['name'],
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
              itemCount: status.length,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Changes to your privacy settings won't affect status updates that you've sent already",
              style: TextStyle(
                fontSize: 16,
                color: grey,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  color: one,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    child: Text(
                      'DONE',
                      style: TextStyle(
                        fontSize: 17,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
