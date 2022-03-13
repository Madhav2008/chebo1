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

  final List vibrateMessages = [
    {'name': 'off'.tr},
    {'name': 'default'.tr},
    {'name': 'short'.tr},
    {'name': 'long'.tr},
  ];
  final List lightMessages = [
    {'name': 'none'.tr},
    {'name': 'white'.tr},
    {'name': 'red'.tr},
    {'name': 'yellow'.tr},
    {'name': 'green'.tr},
    {'name': 'cyan'.tr},
    {'name': 'long'.tr},
    {'name': 'long'.tr},
    {'name': 'long'.tr},
  ];
  final List vibrateGroups = [
    {'name': 'off'.tr},
    {'name': 'default'.tr},
    {'name': 'short'.tr},
    {'name': 'long'.tr},
  ];
  final List lightGroups = [
    {'name': 'none'.tr},
    {'name': 'white'.tr},
    {'name': 'red'.tr},
    {'name': 'yellow'.tr},
    {'name': 'green'.tr},
    {'name': 'cyan'.tr},
    {'name': 'long'.tr},
    {'name': 'long'.tr},
    {'name': 'long'.tr},
  ];

  vibrateMessagesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('vibrate'.tr),
          content: Container(
            width: double.minPositive,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      // updateLanguage(locale[index]['locale']);
                    },
                    child: Text(
                      vibrateMessages[index]['name'],
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
              itemCount: vibrateMessages.length,
            ),
          ),
        );
      },
    );
  }

  lightMessagesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('light'.tr),
          content: Container(
            width: double.minPositive,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      // updateLanguage(locale[index]['locale']);
                    },
                    child: Text(
                      lightMessages[index]['name'],
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
              itemCount: lightMessages.length,
            ),
          ),
        );
      },
    );
  }

  vibrateGroupsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('vibrate'.tr),
          content: Container(
            width: double.minPositive,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      // updateLanguage(locale[index]['locale']);
                    },
                    child: Text(
                      vibrateGroups[index]['name'],
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
              itemCount: vibrateGroups.length,
            ),
          ),
        );
      },
    );
  }

  lightGroupsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('light'.tr),
          content: Container(
            width: double.minPositive,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      // updateLanguage(locale[index]['locale']);
                    },
                    child: Text(
                      lightGroups[index]['name'],
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
              itemCount: lightGroups.length,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notification'.tr),
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
                        'resetNotificationSettings'.tr,
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
                  'conversationTones'.tr,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'conversationTonesDown'.tr,
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
                    'messages'.tr,
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
                  'notificationTone'.tr,
                ),
                subtitle: Text(
                  'default'.tr + '(WaterDrop_preview.ogg)',
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
                  vibrateMessagesDialog(context);
                },
                title: Text(
                  'vibrate'.tr,
                ),
                subtitle: Text(
                  'default'.tr,
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
                  'popupNotification'.tr,
                  style: TextStyle(
                    color: grey.withOpacity(0.4),
                  ),
                ),
                subtitle: Text(
                  'noPopup'.tr,
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
                onTap: () {
                  lightMessagesDialog(context);
                },
                title: Text(
                  'light'.tr,
                ),
                subtitle: Text(
                  'white'.tr,
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
                  'useHighPriorityNotifications'.tr,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'useHighPriorityNotificationsDown'.tr,
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
                    'groups'.tr,
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
                  'notificationTone'.tr,
                ),
                subtitle: Text(
                  'default'.tr + ' (Daydream)',
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
                  vibrateGroupsDialog(context);
                },
                title: Text(
                  'vibrate'.tr,
                ),
                subtitle: Text(
                  'default'.tr,
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
                  lightGroupsDialog(context);
                },
                title: Text(
                  'light'.tr,
                ),
                subtitle: Text(
                  'red'.tr,
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
                  'useHighPriorityNotifications'.tr,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  'useHighPriorityNotificationsDown'.tr,
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
                    'calls'.tr,
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
                  'ringtone'.tr,
                ),
                subtitle: Text(
                  'default'.tr + '(IPhone)',
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
                  'vibrate'.tr,
                ),
                subtitle: Text(
                  'default'.tr,
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
        "resetAllNotificationSettings".tr,
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
              'CANCEL'.tr,
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
              'RESET'.tr,
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
