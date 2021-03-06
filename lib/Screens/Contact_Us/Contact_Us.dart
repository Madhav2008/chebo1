// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:get/get.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  FocusNode focusNode = FocusNode();

  final _recipientController = TextEditingController(
    text: 'support@in.whatsappIndia.com',
  );

  final _subjectController = TextEditingController(
    text: "cantFindWhatImLookingFor".tr,
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
        title: Text('contactUs'.tr),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: black,
              iconTheme: IconThemeData(
                color: white,
              ),
              textTheme: TextTheme().apply(),
            ),
            child: PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        'sendViaEmail'.tr,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'cantFindWhatImLookingFor'.tr,
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
                maxLines: 200,
                minLines: 5,
                decoration: InputDecoration(
                  hintText: 'describeYourProblem'.tr,
                  hintStyle: TextStyle(
                    color: grey,
                  ),
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchURL();
                    },
                    child: Text(
                      'visitOurHelpCentre'.tr,
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
                  _bodyController.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            send();
                          },
                          child: Container(
                            color: one,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              child: Text(
                                'next'.tr,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          color: grey.withOpacity(0.3),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            child: Text(
                              'next'.tr,
                              style: TextStyle(
                                fontSize: 20,
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
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        break;
    }
  }
}
