// ignore_for_file: prefer_const_constructors, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';

class ReplyCard extends StatelessWidget {
  ReplyCard({
    Key? key,
    required this.color,
    required this.textColor,
    required this.message,
    required this.messageTime,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final String message;
  final String messageTime;

  @override
  Widget build(BuildContext context) {
    _launch(url) async {
      url = url;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          color: color,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                10,
              ),
              topRight: Radius.circular(
                10,
              ),
              bottomRight: Radius.circular(
                10,
              ),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 50,
                  top: 5,
                  bottom: 20,
                ),
                child: Linkify(
                  onOpen: (link) => _launch(link.url),
                  text: 
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  messageTime,
                  style: TextStyle(
                    fontSize: 13,
                    color: grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
