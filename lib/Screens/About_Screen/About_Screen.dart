// ignore_for_file: file_abouts, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/About_Model.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({
    Key? key,
    required this.setAboutData,
  }) : super(key: key);

  final Function setAboutData;

  @override
  State<AboutScreen> createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends State<AboutScreen> {
  List<AboutModel> abouts = [
    AboutModel(
      about: 'Hey! there I am using WhatsApp India.',
      logo: 'ππ»',
    ),
    AboutModel(
      about: "Available",
      logo: 'ππ»ββοΈ',
    ),
    AboutModel(
      about: " Busy",
      logo: 'βοΈ',
    ),
    AboutModel(
      about: "At school",
      logo: 'π«',
    ),
    AboutModel(
      about: "At the movies",
      logo: 'π¬',
    ),
    AboutModel(
      about: "At the work",
      logo: 'π»',
    ),
    AboutModel(
      about: "Battery about to die",
      logo: 'π',
    ),
    AboutModel(
      about: "Can't talk, WhatsApp India only",
      logo: 'π£οΈ',
    ),
    AboutModel(
      about: "In a meeting",
      logo: 'π€π»',
    ),
    AboutModel(
      about: "At the gym",
      logo: 'π€Έπ»',
    ),
    AboutModel(
      about: "Sleeping",
      logo: 'ππ»',
    ),
    AboutModel(
      about: "Urgent calls only",
      logo: 'π',
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
        widget.setAboutData(about);
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
          child: Row(
            children: [
              Text(
                about.logo,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                about.about,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
