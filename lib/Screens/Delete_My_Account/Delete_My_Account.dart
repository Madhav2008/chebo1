// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Country_Model.dart';
import 'package:whatsapp/Screens/Change_Number_Screen_One/Change_Number_Screen_One.dart';
import 'package:whatsapp/Screens/Country_Screen/Country_Screen.dart';
import 'package:whatsapp/Screens/Delete_My_Account_Two/Delete_My_Account_Two.dart';

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
                  color: red,
                  size: 25,
                ),
                title: Text(
                  'Deleting your account will:',
                  style: TextStyle(
                    color: red,
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
                      '• Delete your account from WhatsApp India',
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
                      '• Delete you from all of your WhatsApp India group',
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
                  backgroundColor: transparent,
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
                      height: 20,
                    ),
                    Text(
                      'Country',
                      style: TextStyle(
                        color: grey,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  onSelect: (Country country) {
                    setState(() {
                      oldPhoneCountryCode = '+' + country.phoneCode;
                    });
                    print(
                      'Display Name: ${country.displayName}, Country Code: ${country.countryCode}, Display Name No Country Code: ${country.displayNameNoCountryCode}, E163 Key: ${country.e164Key}, E164 SC: ${country.e164Sc}, Example: ${country.example}, Full example with plus sign: ${country.fullExampleWithPlusSign}, Level: ${country.level}, Name: ${country.name}, Name Localized: ${country.nameLocalized}, Phone Code: ${country.phoneCode}, Geographic: ${country.geographic}',
                    );
                  },
                  countryListTheme: CountryListThemeData(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
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
                              Text(
                                countryName,
                                style: TextStyle(
                                  fontSize: 17,
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
                      height: 25,
                    ),
                    Text(
                      'Phone',
                      style: TextStyle(
                        color: grey,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1,
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
                                  fontWeight: FontWeight.w600,
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
                                hintText: 'phone number',
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
            GestureDetector(
              onTap: () {
                _phoneController.text.length < 10
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => DeleteMyAccountTwo(),
                        ),
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Phone no. is required"),
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

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }
}
