// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Chat_Model.dart';
import 'package:whatsapp/Screens/Multi_Device_Beta_Screen/Multi_Device_Beta_Screen.dart';
import 'package:whatsapp/Screens/Navigation/Navigation.dart';

class LinkedDevices extends StatefulWidget {
  LinkedDevices({
    Key? key,
    required this.avatar,
    required this.name,
    required this.phoneno,
    required this.countryCode,
    required this.about,
    // required this.sourceChat,
    // required this.chatModels,
  }) : super(key: key);

  final String name;
  final String avatar;
  final String phoneno;
  final String countryCode;
  final String about;
  // final ChatModel sourceChat;
  // final List<ChatModel> chatModels;

  @override
  _LinkedDevicesState createState() => _LinkedDevicesState();
}

class _LinkedDevicesState extends State<LinkedDevices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => NavigationScreen(
                  cameras: [],
                  name: widget.name,
                  about: widget.about,
                  phoneno: widget.phoneno,
                  avatar: widget.avatar,
                  countryCode: widget.countryCode,
                  // sourceChat: widget.sourceChat,
                  // chatModels: widget.chatModels,
                ),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
        title: Text(
          'Linked devices',
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // child: Icon(Icons.device_thermostat_sharp),
          children: [
            Image.asset(
              '../assets/images/linkeddevices.png',
              width: 200,
              height: 200,
              color: grey,
            ),
            Text(
              'Use WhatsApp India on other devices',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Text(
            //   'Send or receive messages from your browser, computer or Facebook portal',
            //   style: TextStyle(
            //     fontSize: 25,
            //     color: grey,
            //   ),
            // ),

            // ignore: deprecated_member_use
            GestureDetector(
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) => _joinBeta(context),
                // );
              },
              child: Container(
                color: one,
                width: MediaQuery.of(context).size.width - 50,
                height: 40,
                child: Center(
                  child: Text(
                    'LINK A DEVICE',
                    style: TextStyle(
                      fontSize: 17,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MultiDeviceBetaScreen(
                      name: widget.name,
                      about: widget.about,
                      phoneno: widget.phoneno,
                      avatar: widget.avatar,
                      countryCode: widget.countryCode,
                      sourceChat: widget.sourceChat,
                      chatModels: widget.chatModels,
                    ),
                  ),
                );
              },
              leading: Icon(
                Icons.science,
                color: one,
                size: 30,
              ),
              title: Text(
                'Multi-device beta',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                'Use up to 4 devices without keeping your phone online. Tap to learn more.',
                style: TextStyle(
                  color: grey,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
