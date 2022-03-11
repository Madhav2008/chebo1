// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Contact_Support/Contact_Support.dart';

class ProblemDetectedScreen extends StatefulWidget {
  const ProblemDetectedScreen({Key? key}) : super(key: key);

  @override
  State<ProblemDetectedScreen> createState() => _ProblemDetectedScreenState();
}

class _ProblemDetectedScreenState extends State<ProblemDetectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem detected'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We didn't dectect a valid phone number.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Please go back tot the previous screen and enter your phone number in full international format:",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "1. Choose your country from country list. This will automatically fill the country code.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "2. Enter your phone number. Omit any leading 0s before the phone number.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "For example, a correct India phone number will be as +91 7982880636 after being entered.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'For more information, please read our ',
                        style: TextStyle(
                          fontSize: 17,
                          color: white,
                        ),
                      ),
                      TextSpan(
                        text: 'FAQ.',
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
          ),
          Expanded(
            child: Container(
              height: 1,
            ),
          ),
          ListTile(
            tileColor: one,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ContactSupport(),
                ),
              );
            },
            title: Center(
              child: Text(
                "This doesn't answer my question",
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
