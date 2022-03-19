// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Change_Number_Screen_One/Change_Number_Screen_One.dart';
import 'package:whatsapp/Screens/Delete_My_Account/Delete_My_Account.dart';
import 'package:whatsapp/Screens/Privacy_Screen/Privacy_Screen.dart';
import 'package:whatsapp/Screens/Request_Account_Info/Request_Account_Info.dart';
import 'package:whatsapp/Screens/Security_Screen/Security_Screen.dart';
import 'package:whatsapp/Screens/Two_Step_Verification/Two_Step_Verification.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('account'.tr),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PrivacyScreen();
                  },
                ),
              );
            },
            leading: Icon(
              Icons.lock,
              size: 25,
              color: grey,
            ),
            title: Text(
              'privacy'.tr,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SecurityScreen();
                  },
                ),
              );
            },
            leading: Icon(
              Icons.security_sharp,
              size: 25,
              color: grey,
            ),
            title: Text(
              'security'.tr,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TwoStepVerification();
                  },
                ),
              );
            },
            leading: Icon(
              Icons.verified_user_rounded,
              size: 25,
              color: grey,
            ),
            title: Text(
              'verification'.tr,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNumberScreenOne(),
                ),
              );
            },
            leading: Icon(
              Icons.send_to_mobile,
              size: 25,
              color: grey,
            ),
            title: Text(
              'changeNumber'.tr,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestAccountInfo(),
                ),
              );
            },
            leading: Icon(
              Icons.feed,
              size: 25,
              color: grey,
            ),
            title: Text(
              'accountInfo'.tr,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeleteMyAccount(),
                ),
              );
            },
            leading: Icon(
              Icons.delete,
              size: 25,
              color: grey,
            ),
            title: Text(
              'deleteMyAccount'.tr,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
