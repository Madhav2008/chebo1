// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whatsapp/Models/Chat_Model.dart';

class SelectAccountScreen extends StatefulWidget {
  const SelectAccountScreen({ Key? key }) : super(key: key);

  @override
  State<SelectAccountScreen> createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: dummyData.length ,itemBuilder: (context, index,)=>,),
    );
  }
}