// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Contact_Model.dart';

class AvatarCard extends StatelessWidget {
  AvatarCard({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: grey,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            chatModel.name,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
