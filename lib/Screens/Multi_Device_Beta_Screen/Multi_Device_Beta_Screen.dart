// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Linked_Devices/Linked_Devices.dart';

class MultiDeviceBetaScreen extends StatefulWidget {
  MultiDeviceBetaScreen({
    Key? key,
    required this.avatar,
    required this.name,
    required this.phoneno,
    required this.about,
  }) : super(key: key);

  final String name;
  final String avatar;
  final String phoneno;
  final String about;

  @override
  _MultiDeviceBetaScreenState createState() => _MultiDeviceBetaScreenState();
}

class _MultiDeviceBetaScreenState extends State<MultiDeviceBetaScreen> {
  _launchURL() async {
    const url =
        'https://faq.whatsapp.com/general/download-and-installation/about-multi-device-beta?lg=en&Ic=IN&eea=0';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(
          'Multi-device beta',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              _launchURL();
            },
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Link copied"),
                ),
              );
              Clipboard.setData(
                ClipboardData(
                  text:
                      'https://faq.whatsapp.com/general/download-and-installation/about-multi-device-beta?lg=en&Ic=IN&eea=0',
                ),
              );
            },
            title: Text('Why join the beta?'),
            subtitle: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'After your devices are linked, your phone will no longer need to stay online to use WhatsApp on web, desktop or Portal. Up to 4 additional devices and 1 phone can be used at once. Learn more.',
                  style: TextStyle(
                    color: grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('Privacy'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your personal messages and calls will continue to be end-to-end encrypted.',
                  style: TextStyle(
                    color: grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              _launchURL();
            },
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Link copied"),
                ),
              );
              Clipboard.setData(
                ClipboardData(
                  text:
                      'https://faq.whatsapp.com/general/download-and-installation/about-multi-device-beta?lg=en&Ic=IN&eea=0',
                ),
              );
            },
            title: Text('Limitations'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '• You cannot message/call from web, desktop or Portal to users who have an outdated version of WhatsApp on their phone',
                  style: TextStyle(
                    color: grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '• Performance and quality may be affected',
                  style: TextStyle(
                    color: grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '• Other',
                      style: TextStyle(
                        color: grey,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      ' minor issues',
                      style: TextStyle(
                        color: blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            children: [
              Text(
                'You can leave the beta at any time.',
                style: TextStyle(
                  color: grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _joinBeta(context),
                  );
                },
                child: Container(
                  color: one,
                  width: MediaQuery.of(context).size.width - 50,
                  height: 40,
                  child: Center(
                    child: Text(
                      'JOIN BETA',
                      style: TextStyle(
                        fontSize: 17,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _joinBeta(BuildContext context) {
    return AlertDialog(
      title: Text(
        "After joining the beta, you'll need to link your companion devices again by scanning the QR code.",
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'CANCEL',
              style: TextStyle(
                color: one,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => LinkedDevices(
                    name: widget.name,
                    about: widget.about,
                    phoneno: widget.phoneno,
                    avatar: widget.avatar,
                  ),
                ),
              );
            },
            child: Text(
              'CONTINUE',
              style: TextStyle(
                color: one,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
