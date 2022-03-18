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
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<AboutModel> abouts = [
    AboutModel(
      about: 'Hey! there I am using WhatsApp India.',
      logo: '👋🏻',
    ),
    AboutModel(
      about: "Available",
      logo: '🙋🏻‍♂️',
    ),
    AboutModel(
      about: "Busy",
      logo: '⚒️',
    ),
    AboutModel(
      about: "At school",
      logo: '🏫',
    ),
    AboutModel(
      about: "At the movies",
      logo: '🎬',
    ),
    AboutModel(
      about: "At the work",
      logo: '💻',
    ),
    AboutModel(
      about: "Battery about to die",
      logo: '🔋',
    ),
    AboutModel(
      about: "Can't talk, WhatsApp India only",
      logo: '🗣️',
    ),
    AboutModel(
      about: "In a meeting",
      logo: '🤝🏻',
    ),
    AboutModel(
      about: "At the gym",
      logo: '🤸🏻',
    ),
    AboutModel(
      about: "Sleeping",
      logo: '🛌🏻',
    ),
    AboutModel(
      about: "Urgent calls only",
      logo: '📞',
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
              SizedBox(
                width: 15,
              ),
              Text(
                about.logo + ' ' + about.about,
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
