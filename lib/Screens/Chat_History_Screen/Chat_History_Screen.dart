// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Export_Chat_Screen/Export_Chat_Screen.dart';

class ChatHistoryScreen extends StatelessWidget {
  ChatHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat history",
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) {
                    return ExportChatScreen();
                  },
                ),
              );
            },
            leading: Icon(
              Icons.file_upload_outlined,
              size: 25,
              color: grey,
            ),
            title: Text(
              'Export chat',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _archiveAll(context);
                },
              );
            },
            leading: Icon(
              Icons.archive_rounded,
              size: 25,
              color: grey,
            ),
            title: Text(
              'Archive all chats',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ClearAllChats();
                },
              );
            },
            leading: Icon(
              Icons.remove_circle_outline_sharp,
              size: 25,
              color: grey,
            ),
            title: Text(
              'Clear all chats',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DeleteAllChats();
                },
              );
            },
            leading: Icon(
              Icons.delete,
              size: 25,
              color: grey,
            ),
            title: Text(
              'Delete all chats',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _archiveAll(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure you want to archive ALL chats?'),
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
              'OK',
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

class ClearAllChats extends StatefulWidget {
  ClearAllChats({Key? key}) : super(key: key);

  @override
  _ClearAllChatsState createState() {
    return _ClearAllChatsState();
  }
}

class _ClearAllChatsState extends State<ClearAllChats> {
  bool isChecked = false;
  bool isChecked1 = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Clear messages in chats?'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Messages in all chats will disappear forever.',
              style: TextStyle(
                color: grey,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: one,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Delete media in chats'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked1,
                  activeColor: one,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Delete starred messages'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
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
                    'CLEAR MESSAGES',
                    style: TextStyle(
                      color: one,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteAllChats extends StatefulWidget {
  DeleteAllChats({Key? key}) : super(key: key);

  @override
  _DeleteAllChatsState createState() {
    return _DeleteAllChatsState();
  }
}

class _DeleteAllChatsState extends State<DeleteAllChats> {
  bool isChecked2 = true;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Are you sure you want to delete all chats?',
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: isChecked2,
                  activeColor: one,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked2 = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Delete media in chats'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
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
                    'CLEAR MESSAGES',
                    style: TextStyle(
                      color: one,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
