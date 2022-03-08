// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Change_Number_Screen_Three/Change_Number_Screen_Three.dart';

class ChangeNumberScreenTwo extends StatelessWidget {
  ChangeNumberScreenTwo({Key? key}) : super(key: key);

  final TextEditingController _oldPhoneController = TextEditingController();
  final TextEditingController _newPhoneController = TextEditingController();
  final oldPhoneCountryCode = '+91';
  final newPhoneCountryCode = '+91';

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
              'Enter your old phone number with country code:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.5,
                          color: one,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        oldPhoneCountryCode,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 180,
                    child: TextField(
                      controller: _oldPhoneController,
                      maxLength: 10,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'phone number',
                        counter: Offstage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Enter your new phone number with country code:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.5,
                          color: one,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        newPhoneCountryCode,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 180,
                    child: TextField(
                      controller: _newPhoneController,
                      maxLength: 10,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'phone number',
                        counter: Offstage(),
                      ),
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
            GestureDetector(
              onTap: () {
                _oldPhoneController.text.isEmpty
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Old phone no. is required"),
                        ),
                      )
                    : _newPhoneController.text.isEmpty
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("New phone no. is required"),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => ChangeNumberScreenThree(
                                oldPhoneNo: _oldPhoneController.text,
                                newPhoneNo: _newPhoneController.text,
                                oldPhoneNoCountryCode: oldPhoneCountryCode,
                                newPhoneNoCountryCode: newPhoneCountryCode,
                              ),
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
                    'NEXT',
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
