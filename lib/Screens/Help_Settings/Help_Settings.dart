// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/App_Info/App_Info.dart';
import 'package:whatsapp/Screens/Contact_Us/Contact_Us.dart';

class HelpSettings extends StatelessWidget {
  const HelpSettings({Key? key}) : super(key: key);

  _helpCentre() async {
    const url =
        'https://faq.whatsapp.com/android?lg=en&lc=IN&eea=0&anid=d1f87c7e-4a3d-4aaf-990b-0b5cf84b445f';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _termsAndPrivacyPolicy() async {
    const url = 'https://www.whatsapp.com/legal/?lg=en&lc=IN&eea=0';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              _helpCentre();
            },
            leading: Icon(
              Icons.help_outline,
              size: 25,
              color: grey,
            ),
            title: Text(
              'Help Centre',
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
                  builder: (context) => ContactUs(),
                ),
              );
            },
            leading: Icon(
              Icons.people,
              size: 25,
              color: grey,
            ),
            title: Text(
              'Contact us',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Questions? Need help?',
                  style: TextStyle(
                    fontSize: 15,
                    color: grey,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              _termsAndPrivacyPolicy();
            },
            leading: Icon(
              Icons.feed,
              size: 25,
              color: grey,
            ),
            title: Text(
              'Terms and Privacy Policy',
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
                  builder: (context) => AppInfo(),
                ),
              );
            },
            leading: Icon(
              Icons.info_outline,
              size: 25,
              color: grey,
            ),
            title: Text(
              'App info',
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
