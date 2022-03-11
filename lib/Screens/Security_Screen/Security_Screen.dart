// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class SecurityScreen extends StatefulWidget {
  SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool securityNotify = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Security',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              '../assets/images/security.png',
              width: 130,
              height: 130,
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Messages and calls in end-to-end encrypted chats stay between you and the people you choose. Not even WhatsApp can read or listen to them. ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: grey,
                    ),
                  ),
                  TextSpan(
                    text: 'Learn more.',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Show security notifications',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Get notified when your security code changes for a contact in an end-to-end encrypted chat. ",
                          style: TextStyle(
                            color: grey,
                            fontSize: 17,
                          ),
                        ),
                        TextSpan(
                          text: 'Learn more.',
                          style: TextStyle(
                            fontSize: 17,
                            color: blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: Switch(
                value: securityNotify,
                onChanged: (value) {
                  setState(() {
                    securityNotify = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
