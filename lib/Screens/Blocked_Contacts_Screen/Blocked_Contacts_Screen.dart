// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class BlockedContactsScreen extends StatefulWidget {
  const BlockedContactsScreen({Key? key}) : super(key: key);

  @override
  State<BlockedContactsScreen> createState() {
    return _BlockedContactsScreenState();
  }
}

class _BlockedContactsScreenState extends State<BlockedContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blocked contacts',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_add,
              color: white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contacts',
              style: TextStyle(
                fontSize: 17,
                color: grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => ChatScreen(
                //       avatar: dummyData[i].avatarUrl,
                //       name: dummyData[i].name,
                //       phoneno: dummyData[i].phoneno,
                //       about: dummyData[i].about,
                //     ),
                //   ),
                // );
              },
              leading: CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: grey,
                child: Icon(
                  Icons.person,
                  color: white,
                  size: 30,
                ),
              ),
              title: Text(
                '+91' ' ' '7011698878',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
