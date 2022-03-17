// ignore_for_file: file_abouts, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/About_Model.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<AboutModel> abouts = [
    AboutModel(
      about: 'Hey! there I am using WhatsApp India.',
    ),
    AboutModel(
      about: "Available",
    ),
    AboutModel(
      about: "Busy",
    ),
    AboutModel(
      about: "At school",
    ),
    AboutModel(
      about: "At the movies",
    ),
    AboutModel(
      about: "At the work",
    ),
    AboutModel(
      about: "Battery about to die",
    ),
    AboutModel(
      about: "Can't talk, WhatsApp India only",
    ),
    AboutModel(
      about: "In a meeting",
    ),
    AboutModel(
      about: "At the gym",
    ),
    AboutModel(
      about: "Sleeping",
    ),
    AboutModel(
      about: "Urgent calls only",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: abouts.length,
        itemBuilder: (
          context,
          index,
        ) {
          return card(
            abouts[index],
          );
        },
      ),
    );
  }

  Widget card(AboutModel about) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Card(
        color: transparent,
        margin: EdgeInsets.all(
          0.15,
        ),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          child: Text(about.about),
        ),
      ),
    );
  }
}
