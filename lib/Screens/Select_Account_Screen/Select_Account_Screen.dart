// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Chat_Model.dart';
import 'package:whatsapp/Screens/Navigation/Navigation.dart';

class SelectAccountScreen extends StatefulWidget {
  SelectAccountScreen({Key? key}) : super(key: key);

  @override
  State<SelectAccountScreen> createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {
  @override
  Widget build(BuildContext context) {
    ChatModel sourceChat;
    return Scaffold(
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (
          context,
          index,
        ) {
          return InkWell(
            onTap: () {
              sourceChat = dummyData.removeAt(index);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => NavigationScreen(
                      cameras: [],
                      name: 'name',
                      avatar: 'avatar',
                      phoneno: 'phoneno',
                      countryCode: 'countryCode',
                      about: 'about',
                    ),
                  ));
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: white,
                  size: 30,
                ),
                backgroundColor: one,
              ),
              title: Text(dummyData[index].name),
            ),
          );
        },
      ),
    );
  }
}
