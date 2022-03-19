// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class ChangeNumberScreenThree extends StatefulWidget {
  ChangeNumberScreenThree({
    Key? key,
    required this.oldPhoneNo,
    required this.newPhoneNo,
    required this.oldPhoneNoCountryCode,
    required this.newPhoneNoCountryCode,
  }) : super(key: key);

  final String oldPhoneNo;
  final String newPhoneNo;
  final String oldPhoneNoCountryCode;
  final String newPhoneNoCountryCode;

  @override
  State<ChangeNumberScreenThree> createState() =>
      _ChangeNumberScreenThreeState();
}

class _ChangeNumberScreenThreeState extends State<ChangeNumberScreenThree> {
  bool notify = false;
  String contacts = '14';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change number',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              'You are about to change your number from ' +
                  widget.oldPhoneNoCountryCode +
                  ' ' +
                  widget.oldPhoneNo +
                  ' ' +
                  'to ' +
                  widget.newPhoneNoCountryCode +
                  ' ' +
                  widget.newPhoneNo +
                  '.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: grey,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                thickness: 2,
              ),
            ),
            ListTile(
              title: Text('Notify contacts'),
              trailing: Switch(
                value: notify,
                onChanged: (value) {
                  setState(() {
                    notify = value;
                  });
                },
              ),
            ),
            notify
                ? Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Your groups and ' +
                            contacts +
                            ' contacts will be notified about your new number.',
                        style: TextStyle(
                          color: grey,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  )
                : Container(),
            Expanded(
              child: Container(
                height: 1,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) {
                      return NextScreen();
                    },
                  ),
                );
              },
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
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
