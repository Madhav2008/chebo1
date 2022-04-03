// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Change_Number_Screen_Three/Change_Number_Screen_Three.dart';

class ChangeNumberScreenTwo extends StatefulWidget {
  ChangeNumberScreenTwo({Key? key}) : super(key: key);

  @override
  State<ChangeNumberScreenTwo> createState() => _ChangeNumberScreenTwoState();
}

class _ChangeNumberScreenTwoState extends State<ChangeNumberScreenTwo> {
  final TextEditingController _oldPhoneController = TextEditingController();

  final TextEditingController _newPhoneController = TextEditingController();

  String oldPhoneCountryCode = '+91';

  String newPhoneCountryCode = '+91';

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
                  GestureDetector(
                    onTap: (){},
                    child: Container(
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
                _oldPhoneController.text.length < 10
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Old phone no. is required"),
                        ),
                      )
                    : _newPhoneController.text.length < 10
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("New phone no. is required"),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) {
                                return ChangeNumberScreenThree(
                                  oldPhoneNo: _oldPhoneController.text,
                                  newPhoneNo: _newPhoneController.text,
                                  oldPhoneNoCountryCode: oldPhoneCountryCode,
                                  newPhoneNoCountryCode: newPhoneCountryCode,
                                );
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
