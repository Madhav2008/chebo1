// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class AppInfo extends StatelessWidget {
  AppInfo({Key? key}) : super(key: key);

  final version = '1.0.0';
  final year = '2022-2022';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              '../assets/images/appinfo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'WhatsApp Messenger',
                  style: TextStyle(
                    color: white,
                    fontSize: 27,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Version ' + version,
                  style: TextStyle(
                    color: white.withOpacity(
                      0.5,
                    ),
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  '../assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copyright_sharp,
                      color: white.withOpacity(
                        0.5,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      year + ' WhatsApp Inc.',
                      style: TextStyle(
                        color: white.withOpacity(
                          0.5,
                        ),
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                Text(
                  'All rights reserved.',
                  style: TextStyle(
                    color: white.withOpacity(
                      0.5,
                    ),
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
