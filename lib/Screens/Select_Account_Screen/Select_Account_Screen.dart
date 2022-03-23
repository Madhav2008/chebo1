// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Chat_Model.dart';

class SelectAccountScreen extends StatefulWidget {
  SelectAccountScreen({Key? key}) : super(key: key);

  @override
  State<SelectAccountScreen> createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (
          context,
          index,
        ) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: white,
                size: 30,
              ),
              backgroundColor: one,
            ),
            title: Text(dummyData[index].name),
          );
        },
      ),
    );
  }
}
