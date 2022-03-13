// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ContactsHelpScreen extends StatelessWidget {
  ContactsHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts help',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "If some of your friends don't appear in the contacts list, we recommend the following steps:",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "• Make sure that your friend's phone number is in your address book",
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "• Make sure that your friend is using WhatsApp India",
            ),
          ],
        ),
      ),
    );
  }
}
