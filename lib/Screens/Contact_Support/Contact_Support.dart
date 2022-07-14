// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';

class ContactSupport extends StatefulWidget {
  ContactSupport({Key? key}) : super(key: key);

  @override
  _ContactSupportState createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  FocusNode focusNode = FocusNode();

  final _recipientController = TextEditingController(
    text: 'support@in.whatsappIndia.com',
  );

  final _subjectController = TextEditingController(
    text: "Can't find what I'm looking for",
  );

  final _bodyController = TextEditingController();

  _launchURL() async {
    const url = 'https://faq.whatsapp.com/payments';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact support'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Can't find what I'm looking for",
              style: TextStyle(
                color: grey,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              controller: _bodyController,
              focusNode: focusNode,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              minLines: 5,
              decoration: InputDecoration(
                hintText: "Describe your problem",
                hintStyle: TextStyle(
                  color: grey,
                ),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchURL();
                  },
                  child: Text(
                    'Visit our Help Centre',
                    style: TextStyle(
                      color: blue,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _bodyController.text.isNotEmpty ? send() : null;
                  },
                  child: Container(
                    color: one,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
