// ignore_for_file: file_names, prefer_const_constructors, avoid_print, dead_code, unused_label, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Select_Contact/Select_Contact.dart';

class CallsScreen extends StatelessWidget {
  CallsScreen({Key? key}) : super(key: key);

  final phoneNo = '7982880636';

  _makingPhoneCall() async {
    final url = 'tel:' + phoneNo;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          callCard(
            "Priya Arora",
            Icons.call_made,
            secondary,
            "Jan 21, 18:20PM",
            "https://lumiere-a.akamaihd.net/v1/images/sa_pixar_virtualbg_coco_16x9_9ccd7110.jpeg",
          ),
          callCard(
            "Vijay Arora",
            Icons.call_missed,
            Colors.red,
            "Jan 20, 20:20PM",
            "https://images.pexels.com/photos/1034662/pexels-photo-1034662.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ),
          callCard(
            "Bobby Arora",
            Icons.call_received,
            secondary,
            "Jan 20, 18:45PM",
            "https://images.unsplash.com/photo-1592743263126-bb241ee76ac7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmF0dXJhbCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&w=1000&q=80",
          ),
          callCard(
            "Vijay Arora",
            Icons.call_made,
            secondary,
            "Jan 18, 15:30PM",
            "https://images.pexels.com/photos/1034662/pexels-photo-1034662.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ),
          callCard(
            "Priya Arora",
            Icons.call_made,
            secondary,
            "Jan 17, 18:20PM",
            "https://lumiere-a.akamaihd.net/v1/images/sa_pixar_virtualbg_coco_16x9_9ccd7110.jpeg",
          ),
          callCard(
            "Vijay Arora",
            Icons.call_missed,
            Colors.red,
            "Jan 15, 11:30AM",
            "https://images.pexels.com/photos/1034662/pexels-photo-1034662.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ),
          callCard(
            "Sonia Arora",
            Icons.call_missed,
            Colors.red,
            "Jan 15, 11:30AM",
            "https://images.pexels.com/photos/586744/pexels-photo-586744.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: one,
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => SelectContact()),
        ),
      ),
    );
  }

  Widget callCard(
    String name,
    IconData iconData,
    Color iconColor,
    String time,
    String image,
  ) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: NetworkImage(image),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: 20,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12.8,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.call,
          size: 25,
          color: one,
        ),
        onPressed: () {
          _makingPhoneCall();
        },
      ),
    );
  }
}
