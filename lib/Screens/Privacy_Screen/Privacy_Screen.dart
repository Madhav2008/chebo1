// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Blocked_Contacts_Screen/Blocked_Contacts_Screen.dart';
import 'package:whatsapp/Screens/Default_Message_Timer/Default_Message_Timer.dart';
import 'package:whatsapp/Screens/Fingerprint_Screen/Fingerprint_Screen.dart';
import 'package:whatsapp/Screens/Groups_Privacy/Groups_Privacy.dart';
import 'package:whatsapp/Screens/Live_Location_Screen/Live_Location_Screen.dart';
import 'package:whatsapp/Screens/Status_Privacy_Screen/Status_Privacy_Screen.dart';

class PrivacyScreen extends StatefulWidget {
  PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool messageTimer = false;
  bool readReceipts = true;
  final statusExcluded = '0';

  final List lastSeen = [
    {'name': 'Everone'},
    {'name': 'My contacts'},
    {'name': 'Nobody'},
  ];

  final List profilePhoto = [
    {'name': 'Everone'},
    {'name': 'My contacts'},
    {'name': 'Nobody'},
  ];

  final List about = [
    {'name': 'Everone'},
    {'name': 'My contacts'},
    {'name': 'Nobody'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 13.0),
                child: Text(
                  'Who can see my personal info',
                  style: TextStyle(
                    fontSize: 17,
                    color: grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 13.0),
                child: Text(
                  "If you don't share your Last Seen, you won't be able to see other people's Last Seen",
                  style: TextStyle(
                    fontSize: 17,
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  _lastSeen(context);
                },
                title: Text(
                  'Last Seen',
                ),
                subtitle: Text(
                  'Everyone',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  _profilePhoto(context);
                },
                title: Text(
                  'Profile photo',
                ),
                subtitle: Text(
                  'Everyone',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  _about(context);
                },
                title: Text(
                  'About',
                ),
                subtitle: Text(
                  'Everyone',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => StatusPrivacyScreen(),
                    ),
                  );
                },
                title: Text(
                  'Status',
                ),
                subtitle: Text(
                  statusExcluded + ' contacts excluded',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  'Read receipts',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  "If turned off, won't send or receive Read receipts. Read receipts are always sent for group chats.",
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
                trailing: Switch(
                  value: readReceipts,
                  onChanged: (value) {
                    setState(() {
                      readReceipts = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    'Disappearing messages',
                    style: TextStyle(
                      fontSize: 17,
                      color: grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => DefaultMessageTimer(),
                    ),
                  );
                },
                title: Text(
                  'Default message timer',
                ),
                subtitle: Text(
                  'Start new chats with disappearing messages set to your timer',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
                // trailing: Switch(
                //   value: messageTimer,
                //   onChanged: (value) {
                //     setState(() {
                //       messageTimer = value;
                //     });
                //   },
                // ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => GroupsPrivacyScreen(),
                    ),
                  );
                },
                title: Text(
                  'Groups',
                ),
                subtitle: Text(
                  'Everyone',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => LiveLocationScreen(),
                    ),
                  );
                },
                title: Text(
                  'Live location',
                ),
                subtitle: Text(
                  'None',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => BlockedContactsScreen(),
                    ),
                  );
                },
                title: Text(
                  'Blocked Contacts',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  '0',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => FingerprintScreen(),
                    ),
                  );
                },
                title: Text(
                  'Fingerprint lock',
                ),
                subtitle: Text(
                  'Disabled',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
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
    );
  }

  _lastSeen(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('Last seen'),
          content: Container(
            width: double.minPositive,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // updateLanguage(locale[index]['locale']);
                    },
                    child: Text(
                      lastSeen[index]['name'],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: grey,
                  thickness: 2,
                );
              },
              itemCount: lastSeen.length,
            ),
          ),
        );
      },
    );
  }

  _profilePhoto(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('Profile photo'),
          content: Container(
            width: double.minPositive,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // updateLanguage(locale[index]['locale']);
                    },
                    child: Text(
                      profilePhoto[index]['name'],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: grey,
                  thickness: 2,
                );
              },
              itemCount: profilePhoto.length,
            ),
          ),
        );
      },
    );
  }

  _about(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('About'),
          content: Container(
            width: double.minPositive,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // updateLanguage(locale[index]['locale']);
                    },
                    child: Text(
                      about[index]['name'],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: grey,
                  thickness: 2,
                );
              },
              itemCount: about.length,
            ),
          ),
        );
      },
    );
  }
}
