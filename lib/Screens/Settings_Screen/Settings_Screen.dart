// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Account_Settings/Account_Settings.dart';
import 'package:whatsapp/Screens/Chats_Settings/Chats_Settings.dart';
import 'package:whatsapp/Screens/Help_Settings/Help_Settings.dart';
import 'package:whatsapp/Screens/Invite_A_Friend/Invite_A_Friend.dart';
import 'package:whatsapp/Screens/Notifications_Settings/Notifications_Settings.dart';
import 'package:whatsapp/Screens/Profile_Screen/Profile_Screen.dart';
import 'package:whatsapp/Screens/Qr_Code_Screen/Qr_Code_Screen.dart';
import 'package:whatsapp/Screens/Storage_And_Data_Settings/Storage_And_Data_Settings.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({
    Key? key,
    required this.avatar,
    required this.name,
    required this.about,
    required this.phoneno,
    required this.countryCode,
  }) : super(key: key);

  final String name;
  final String avatar;
  final String about;
  final String phoneno;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen(
                        name: name,
                        avatar: avatar,
                        about: about,
                        phoneno: phoneno,
                        countryCode: countryCode,
                      );
                    },
                  ),
                );
              },
              leading: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: CircleAvatar(
                  radius: 20,
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: grey,
                  backgroundImage: NetworkImage(
                    avatar,
                  ),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Text(
                  about,
                  style: TextStyle(
                    color: grey,
                    fontSize: 15.0,
                  ),
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.qr_code,
                  size: 25,
                  color: one,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) {
                        return QRCodeScreen(
                          name: name,
                          avatar: avatar,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Image.asset(
                "../assets/images/account.png",
                width: 35,
                height: 35,
                color: grey,
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "account".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                "accountDown".tr,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AccountScreen();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.chat,
                color: grey,
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "chats".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                "chatDown".tr,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChatsSettings();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                size: 30,
                color: grey,
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "notification".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                "notificationDown".tr,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NotificationsSettings();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.data_saver_off_sharp,
                size: 30,
                color: grey,
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "storageData".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                "storageDataDown".tr,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StorageAndDataSettings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.help_outline,
                size: 30,
                color: grey,
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "help".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                "helpDown".tr,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpSettings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                size: 30,
                color: grey,
              ),
              title: Text(
                "invite".tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InviteAFriend(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'from'.tr,
              style: TextStyle(
                color: grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  '../assets/images/meta.png',
                  width: 22,
                  height: 22,
                  color: secondary,
                ),
                Text(
                  'meta'.tr,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
