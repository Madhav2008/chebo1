// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:get/get.dart';

class NotificationsSettings extends StatefulWidget {
  NotificationsSettings({Key? key}) : super(key: key);

  @override
  State<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  bool conversationTones = true;
  bool highPriorityNotificationsMessages = true;
  bool highPriorityNotificationsGroups = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: black,
              iconTheme: IconThemeData(
                color: white,
              ),
              textTheme: TextTheme().apply(),
            ),
            child: PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      Text(
                        'Reset notification settings'.tr,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {},
                title: Text(
                  'Conversation tones'.tr,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'Play sounds for incoming and outgoing messages.'.tr,
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
                trailing: Switch(
                  value: conversationTones,
                  onChanged: (value) {
                    setState(() {
                      conversationTones = value;
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
                    'Messages'.tr,
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
                onTap: () {},
                title: Text(
                  'Notification tone'.tr,
                ),
                subtitle: Text(
                  'Default'.tr + '(WaterDrop_preview.ogg)',
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
                onTap: () {},
                title: Text(
                  'Vibrate'.tr,
                ),
                subtitle: Text(
                  'Default'.tr,
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
                onTap: () {},
                title: Text(
                  'Popup notification',
                  style: TextStyle(
                    color: grey.withOpacity(0.4),
                  ),
                ),
                subtitle: Text(
                  'No popup',
                  style: TextStyle(
                    color: grey.withOpacity(0.4),
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Light',
                ),
                subtitle: Text(
                  'White',
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
                onTap: () {},
                title: Text(
                  'Use high priority notifications',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'Show previews of notifications at the top of the screen',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
                trailing: Switch(
                  value: highPriorityNotificationsMessages,
                  onChanged: (value) {
                    setState(() {
                      highPriorityNotificationsMessages = value;
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
                    'Groups',
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
                onTap: () {},
                title: Text(
                  'Notification tone',
                ),
                subtitle: Text(
                  'Default (Daydream)',
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
                onTap: () {},
                title: Text(
                  'Vibrate',
                ),
                subtitle: Text(
                  'Default',
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
                onTap: () {},
                title: Text(
                  'Light',
                ),
                subtitle: Text(
                  'Red',
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
                onTap: () {},
                title: Text(
                  'Use high priority notifications',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'Show previews of notifications at the top of the screen',
                  style: TextStyle(
                    color: grey,
                    fontSize: 17,
                  ),
                ),
                trailing: Switch(
                  value: highPriorityNotificationsGroups,
                  onChanged: (value) {
                    setState(() {
                      highPriorityNotificationsGroups = value;
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
                    'Calls',
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
                onTap: () {},
                title: Text(
                  'Ringtone',
                ),
                subtitle: Text(
                  'Default (IPhone)',
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
                onTap: () {},
                title: Text(
                  'Vibrate',
                ),
                subtitle: Text(
                  'Default',
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

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        showDialog(
          context: context,
          builder: (builder) => _resetAlert(context),
        );
        break;
    }
  }

  Widget _resetAlert(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Reset all notification settings, including custom notification settings for your chats?",
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
              Navigator.pop(context);
            },
            child: Text(
              'RESET',
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
