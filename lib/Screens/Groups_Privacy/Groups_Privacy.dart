// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class GroupsPrivacyScreen extends StatefulWidget {
  const GroupsPrivacyScreen({Key? key}) : super(key: key);

  @override
  State<GroupsPrivacyScreen> createState() => _GroupsPrivacyScreenState();
}

class _GroupsPrivacyScreenState extends State<GroupsPrivacyScreen> {
  final List status = [
    {'name': 'Everyone'},
    {'name': 'My contacts'},
    {'name': 'My contacts except...'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Groups',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who can add me in groups',
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
              "Admins who can't add you to a group chat will have the option of inviting you privately instead.",
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
