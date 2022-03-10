// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Country_Model.dart';
import 'package:whatsapp/Screens/Change_Number_Screen_One/Change_Number_Screen_One.dart';
import 'package:whatsapp/Screens/Country_Screen/Country_Screen.dart';

class DeleteMyAccount extends StatefulWidget {
  DeleteMyAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<DeleteMyAccount> createState() => _DeleteMyAccountState();
}

class _DeleteMyAccountState extends State<DeleteMyAccount> {
  String countryName = 'India';
  String countryCode = '+91';

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delete my account',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 25,
                ),
                title: Text(
                  'Deleting your account will:',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '• Delete your account from WhatsApp',
                      style: TextStyle(
                        color: grey,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '• Erase your message history',
                      style: TextStyle(
                        color: grey,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '• Delete you from all of your WhatsApp group',
                      style: TextStyle(
                        color: grey,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '• Delete your Google Drive backup',
                      style: TextStyle(
                        color: grey,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 80.0,
              ),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ChangeNumberScreenOne(),
                //     ),
                //   );
                // },
                leading: Icon(
                  Icons.send_to_mobile,
                  size: 25,
                  color: grey,
                ),
                title: Text(
                  'Change number instead?',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNumberScreenOne(),
                          ),
                        );
                      },
                      child: Container(
                        color: one,
                        width: 200,
                        height: 50,
                        child: Center(
                          child: Text(
                            'CHANGE NUMBER',
                            style: TextStyle(
                              fontSize: 17,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ChangeNumberScreenOne(),
                //     ),
                //   );
                // },
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'To delete your account, confirm your country code and enter your phone number.',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => CountryScreen(
                              setCountryData: setCountryData,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 80,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    countryName,
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: one,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
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
                                countryCode,
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
                            width: MediaQuery.of(context).size.width - 190,
                            child: TextField(
                              controller: _phoneController,
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                counter: Offstage(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }
}
