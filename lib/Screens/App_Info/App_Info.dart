// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:get/get.dart';

class AppInfo extends StatelessWidget {
  AppInfo({Key? key}) : super(key: key);

  final version = '1.0.0';
  final year = '2022-2023';

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
                  'WhatsApp India',
                  style: TextStyle(
                    color: white,
                    fontSize: 27,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'version'.tr + ' ' + version,
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
                  '../assets/images/WhatsAppIndiaLogo.png',
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
                      year + ' WhatsApp India Inc.',
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
                  'allRightsReserved'.tr + '.',
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
