// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  CustomCard({ Key? key , required this.name,required this.about, required this.avatar, required this.phoneno, required this.sourceChat, required this.chatModels,}) : super(key: key);

  final String name;
  final String about;
  final String avatar;
  final String phoneno;
  final String sourceChat;
  final String chatModels;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ChatScreen(
                    avatar: dummyData[i].avatarUrl,
                    name: dummyData[i].name,
                    phoneno: dummyData[i].phoneno,
                    about: dummyData[i].about,
                    sourceChat: sourceChat,
                    chatModels: chatModels,
                  ),
                ),
              );
            },
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => ViewProfilePhoto(
                      name: dummyData[i].name,
                      avatar: dummyData[i].avatarUrl,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: grey,
                backgroundImage: NetworkImage(dummyData[i].avatarUrl),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  dummyData[i].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dummyData[i].time,
                  style: TextStyle(
                    color: grey,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            subtitle: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  Icon(
                    Icons.done_all,
                    size: 20,
                    color: blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    dummyData[i].message,
                    style: TextStyle(
                      color: grey,
                      fontSize: 15.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
  }
}