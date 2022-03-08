// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Chat_Backup_Screen/Chat_Backup_Screen.dart';
import 'package:whatsapp/Screens/Chat_History_Screen/Chat_History_Screen.dart';
import 'package:whatsapp/Screens/Chats_Wallpaper_Screen/Chats_Wallpaper_Screen.dart';
import 'package:whatsapp/Theme/Provider/Theme_Provider.dart';
import 'package:whatsapp/Theme/Widget/Change_Theme_Button_Widget.dart';

class ChatsSettings extends StatefulWidget {
  ChatsSettings({Key? key}) : super(key: key);

  @override
  _ChatsSettingsState createState() => _ChatsSettingsState();
}

class _ChatsSettingsState extends State<ChatsSettings> {
  bool archived = true;
  bool enterIsSend = true;
  bool mediaV = false;

  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'हिन्दी', 'locale': Locale('hi', 'IN')},
    {'name': 'বাংলা', 'locale': Locale('bn', 'IN')},
    {'name': 'ਪੰਜਾਬੀ', 'locale': Locale('pa', 'IN')},
    {'name': 'తెలుగు', 'locale': Locale('te', 'IN')},
    {'name': 'मराठी', 'locale': Locale('mr', 'IN')},
    {'name': 'தமிழ்', 'locale': Locale('ta', 'IN')},
    {'name': 'اردو', 'locale': Locale('ur', 'IN')},
    {'name': 'ગુજરાતી', 'locale': Locale('gu', 'IN')},
    {'name': 'ಕನ್ನಡ', 'locale': Locale('kn', 'IN')},
    {'name': 'മലയാളം', 'locale': Locale('ml', 'IN')},
  ];

  final fontSizes = 'Medium';

  final List fontSize = [
    {'name': 'small'.tr},
    {'name': 'medium'.tr},
    {'name': 'large'.tr},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  fontSizeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('fontSize'.tr),
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
                      fontSize[index]['name'],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.blue,
                  thickness: 2,
                );
              },
              itemCount: fontSize.length,
            ),
          ),
        );
      },
    );
  }

  languageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('appLanguage'.tr),
          content: Container(
            width: double.minPositive,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      updateLanguage(locale[index]['locale']);
                    },
                    child: Text(
                      locale[index]['name'],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.blue,
                  thickness: 2,
                );
              },
              itemCount: locale.length,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mode = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? Provider.of<ThemeProvider>(context).themeMode == ThemeMode.system
            ? "systemDefault".tr
            : "darkMode".tr
        : Provider.of<ThemeProvider>(context).themeMode == ThemeMode.system
            ? "systemDefault".tr
            : "lightMode".tr;

    final icon = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? Provider.of<ThemeProvider>(context).themeMode == ThemeMode.system
            ? Icons.model_training_sharp
            : Icons.dark_mode
        : Provider.of<ThemeProvider>(context).themeMode == ThemeMode.system
            ? Icons.model_training_sharp
            : Icons.light_mode;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'chats'.tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(13.0),
              child: Text(
                'display'.tr,
                style: TextStyle(
                  color: grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _theme(context),
                );
              },
              leading: Icon(
                icon,
                size: 27,
              ),
              title: Text(
                "theme".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                mode,
                style: TextStyle(
                  color: grey,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ChatsWallpaperScreen(),
                  ),
                );
              },
              leading: Icon(
                Icons.wallpaper_outlined,
              ),
              title: Text(
                "wallpaper".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(13.0),
              child: Text(
                'chatSettings'.tr,
                style: TextStyle(
                  color: grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                "enterIsSend".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                "enterIsSendDown".tr,
                style: TextStyle(
                  fontSize: 16,
                  color: grey,
                ),
              ),
              trailing: Switch(
                value: enterIsSend,
                onChanged: (value) {
                  setState(() {
                    enterIsSend = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                "mediaVisibility".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                "mediaVisibilityDown".tr,
                style: TextStyle(
                  fontSize: 16,
                  color: grey,
                ),
              ),
              trailing: Switch(
                value: mediaV,
                onChanged: (value) {
                  setState(() {
                    mediaV = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                fontSizeDialog(context);
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                "fontSize".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                "fontSizeDown".tr,
                style: TextStyle(
                  fontSize: 16,
                  color: grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(13.0),
              child: Text(
                'archivedChats'.tr,
                style: TextStyle(
                  color: grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                "keepChatsArchived".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                "keepChatsArchivedDown".tr,
                style: TextStyle(
                  fontSize: 16,
                  color: grey,
                ),
              ),
              trailing: Switch(
                value: archived,
                onChanged: (value) {
                  setState(() {
                    archived = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            ListTile(
              onTap: () {
                languageDialog(context);
              },
              leading: Icon(
                Icons.language_sharp,
              ),
              title: Text(
                "appLanguage".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                "appLanguageDown".tr + ' (' + 'English' + ')',
                style: TextStyle(
                  fontSize: 16,
                  color: grey,
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
                    builder: (BuildContext context) => ChatBackupScreen(),
                  ),
                );
              },
              leading: Icon(
                Icons.backup,
              ),
              title: Text(
                "chatBackup".tr,
                style: TextStyle(
                  fontSize: 20,
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
                    builder: (BuildContext context) => ChatHistoryScreen(),
                  ),
                );
              },
              leading: Icon(
                Icons.history,
              ),
              title: Text(
                "chatHistory".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _theme(BuildContext context) {
  if (Provider.of<ThemeProvider>(context).themeMode == ThemeMode.system) {
    "systemDefault".tr;
  } else if (Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark) {
    "darkMode".tr;
  } else {
    "lightMode".tr;
  }

  final mode = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? Provider.of<ThemeProvider>(context).themeMode == ThemeMode.system
          ? "systemDefault".tr
          : "darkMode".tr
      : Provider.of<ThemeProvider>(context).themeMode == ThemeMode.system
          ? "systemDefault".tr
          : "lightMode".tr;

  final icon = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
      ? Provider.of<ThemeProvider>(context).themeMode == ThemeMode.system
          ? Icons.model_training_sharp
          : Icons.dark_mode
      : Provider.of<ThemeProvider>(context).themeMode == ThemeMode.system
          ? Icons.model_training_sharp
          : Icons.light_mode;

  return AlertDialog(
    title: Text('theme'.tr),
    content: Container(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 15,
          ),
          Icon(
            icon,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            mode,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ChangeThemeButtonWidget(),
        ],
      ),
    ),
    //     ListTile(
    //   leading: Icon(
    //     icon,
    //     size: 30,
    //   ),
    //   title: Text(
    //     mode,
    //     style: TextStyle(
    //       fontSize: 16,
    //     ),
    //   ),
    //   trailing: ChangeThemeButtonWidget(),
    // ),
  );
}
