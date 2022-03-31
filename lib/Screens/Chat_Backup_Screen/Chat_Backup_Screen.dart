// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class ChatBackupScreen extends StatefulWidget {
  ChatBackupScreen({Key? key}) : super(key: key);

  @override
  State<ChatBackupScreen> createState() {
    return _ChatBackupScreenState();
  }
}

class _ChatBackupScreenState extends State<ChatBackupScreen> {
  final local = '1 January, 8:11 pm';
  final googleDrive = '1 January, 8:17 pm';
  final sizeBackup = '209 MB';
  final googleAccount = 'aroramadhav65@gmail.com';
  bool includeVideos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat backup",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.backup,
                  color: grey,
                ),
                title: Text(
                  'Last Backup',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
                subtitle: Text(
                  "Back up your messages and media to Google Drive. You can restore them when you reinstall WhatsApp India. Your messages will also back up to your phone's internal storage.",
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: transparent,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Local: ' + local,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Google Drive: ' + googleDrive,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Size: ' + sizeBackup,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: one,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text('BACK UP'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.add_to_drive_outlined,
                  color: grey,
                ),
                title: Text(
                  'Google Drive settings',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
                subtitle: Text(
                  "Messages and media backed up in Google Drive are not protected by WhatsApp India end-to-end encryption.",
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: transparent,
                ),
                title: Text(
                  'Back up to Google Drive',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  'Daily',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: transparent,
                ),
                title: Text(
                  'Google Account',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  googleAccount,
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: transparent,
                ),
                title: Text(
                  'Back up over',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  'Wi-Fi only',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: transparent,
                ),
                title: Text(
                  'Include videos',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                trailing: Switch(
                  value: includeVideos,
                  onChanged: (value) {
                    setState(() {
                      includeVideos = value;
                    });
                  },
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
}
