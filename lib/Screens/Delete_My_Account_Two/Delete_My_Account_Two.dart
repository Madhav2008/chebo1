// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Delete_My_Account_Three/Delete_My_Account_Three.dart';

class DeleteMyAccountTwo extends StatefulWidget {
  const DeleteMyAccountTwo({Key? key}) : super(key: key);

  @override
  State<DeleteMyAccountTwo> createState() => _DeleteMyAccountTwoState();
}

class _DeleteMyAccountTwoState extends State<DeleteMyAccountTwo> {
  final TextEditingController _improveController = TextEditingController();

  final _reason = [
    'I am changing my device',
    'I am changing my phone number',
    'I am deleting my account temporarily',
    'WhatsApp India is missing a feature',
    'WhatsApp India is not working',
    'Other',
  ];

  String? _currentItemSelected = 'Other';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delete my account',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'We hate to see you leave! Tell us why you are deleting your account:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                style: TextStyle(
                  color: grey,
                ),
                items: _reason.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String? _newValueSelected) {
                  setState(() {
                    _currentItemSelected = _newValueSelected;
                  });
                },
                value: _currentItemSelected,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _improveController,
              decoration: InputDecoration(
                hintText: 'How can we improve? (optional)',
                hintStyle: TextStyle(
                  color: grey,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => DeleteMyAccountThree(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  color: red,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      'DELETE MY ACCOUNT',
                      style: TextStyle(
                        fontSize: 15,
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
