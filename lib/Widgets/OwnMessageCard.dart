// ignore_for_file: prefer_const_constructors, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';

class OwnMessageCard extends StatelessWidget {
  OwnMessageCard({
    Key? key,
    time,
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
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child:
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //         color: black.withOpacity(0.3),
            //         borderRadius: BorderRadius.circular(30),
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.all(10.0),
            //         child: Icon(
            //           Icons.forward,
            //           color: white,
            //           size: 20,
            //         ),
            //       ),
            //     ),
            Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                15,
              ),
              bottomRight: Radius.circular(
                15,
              ),
              bottomLeft: Radius.circular(
                15,
              ),
            ),
          ),
          color: color,
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 70,
                  top: 5,
                  bottom: 20,
                ),
                child: Linkify(
                  onOpen: (link) => _launch(link.url),
                  text: message,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      messageTime,
                      style: TextStyle(
                        fontSize: 14,
                        color: grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                      color: blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //   ],
        // ),
      ),
    );
  }
}
