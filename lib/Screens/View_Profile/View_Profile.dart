// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Media_Links_And_Docs/Media_Links_And_Docs.dart';
import 'package:whatsapp/Screens/View_Chat_Photo/View_Chat_Photo.dart';
import 'package:whatsapp/Screens/View_Profile_Photo/View_Profile_Photo.dart';
import 'package:whatsapp/Screens/WhatsApp_Video_Calling_Screen/WhatsApp_Video_Calling_Screen.dart';

class ViewProfile extends StatelessWidget {
  ViewProfile({
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

  final mediaQuantity = '578';

  _makingPhoneCall() async {
    final url = 'tel:' + phoneno;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildMediaBar() {
    final barHeight = 90.0;
    final vertPadding = 10.0;

    return Container(
      height: barHeight,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: vertPadding),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int _) {
          return Container(
            padding: EdgeInsets.only(right: 5.0),
            width: 70.0,
            height: barHeight - vertPadding * 2,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => ViewChatPhoto(
                      path:
                          'https://raw.githubusercontent.com/ng-kode/whatsapp_clone/master/assets/150x150.png', senderName: '', time: '',
                    ),
                  ),
                );
              },
              child: Image(
                image: NetworkImage(
                  'https://raw.githubusercontent.com/ng-kode/whatsapp_clone/master/assets/150x150.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          left: 8.0,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: grey,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          right: 8.0,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.more_vert),
                          color: grey,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 5.0,
                          top: 5.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ViewProfilePhoto(
                                    name: name,
                                    avatar: avatar,
                                  );
                                },
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                              avatar,
                            ),
                            backgroundColor: grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.0),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          '+91 ' + phoneno,
                          style: TextStyle(
                            fontSize: 17,
                            color: grey,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.call,
                                  color: one,
                                  size: 30,
                                ),
                                onPressed: () {
                                  _makingPhoneCall();
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'audio'.tr,
                                style: TextStyle(
                                  color: one,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.videocam,
                                  color: one,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) {
                                        return WhatsAppVideoCallingScreen(
                                          cameras: [],
                                          avatar: avatar,
                                          name: name,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'video'.tr,
                                style: TextStyle(
                                  color: one,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Divider(
              thickness: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      about,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '18 April 2020',
                      style: TextStyle(
                        color: grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 15,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => MediaLinksAndDocs(
                            name: name,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'mediaLinksAndDocs'.tr,
                          style: TextStyle(
                            color: grey,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          mediaQuantity + ' >',
                          style: TextStyle(
                            color: grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
