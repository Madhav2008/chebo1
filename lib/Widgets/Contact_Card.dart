// ignore_for_file: prefer_const_constructors, file_names, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Contact_Model.dart';

class ContactCard extends StatelessWidget {
  ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 53,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: grey,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
              ),
            ),
            contact.select
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: one,
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: white,
                        size: 13,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
