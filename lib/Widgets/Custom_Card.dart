// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Chat_Screen/Chat_Screen.dart';
import 'package:whatsapp/Screens/View_Profile_Photo/View_Profile_Photo.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    Key? key,
    required this.name,
    required this.about,
    required this.avatar,
    required this.phoneno,
    // required this.sourceChat,
    // required this.chatModels,
    required this.time,
    required this.message,
  }) : super(key: key);

  final String name;
  final String about;
  final String avatar;
  final String phoneno;
  final String time;
  final String message;
  // final ChatModel sourceChat;
  // final List<ChatModel> chatModels;

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
                  avatar: widget.avatar,
                  name: widget.name,
                  phoneno: widget.phoneno,
                  about: widget.about,
                  // sourceChat: widget.sourceChat,
                  // chatModels: widget.chatModels,
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
                    name: widget.name,
                    avatar: widget.avatar,
                  ),
                ),
              );
            },
            child: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: grey,
              backgroundImage: NetworkImage(widget.avatar),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.time,
                style: TextStyle(
                  color: grey,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          subtitle: Container(
            padding: EdgeInsets.only(top: 5.0),
            // child: Row(
            //   children: [
            //     Icon(
            //       Icons.done_all,
            //       size: 20,
            //       color: blue,
            //     ),
            //     SizedBox(
            //       width: 5,
            //     ),
                child:Text(
                  widget.message,
                  style: TextStyle(
                    color: grey,
                    fontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}
