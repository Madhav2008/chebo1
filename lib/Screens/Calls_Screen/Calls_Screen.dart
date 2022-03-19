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
            "Raghav Arora",
            Icons.call_made,
            secondary,
            "Jan 21, 18:20PM",
            "https://avatars.githubusercontent.com/u/66276244?v=4",
          ),
          callCard(
            "Bill Gates",
            Icons.call_missed,
            red,
            "Jan 20, 20:20PM",
            "https://pbs.twimg.com/profile_images/1414439092373254147/JdS8yLGI_400x400.jpg",
          ),
          callCard(
            "Joe",
            Icons.call_missed,
            red,
            "Jan 15, 11:30AM",
            "https://www.mnp.ca/-/media/foundation/integrations/personnel/2020/12/16/13/57/personnel-image-4483.jpg?h=800&w=600&hash=9D5E5FCBEE00EB562DCD8AC8FDA8433D",
          ),
          callCard(
            "John",
            Icons.call_received,
            secondary,
            "Jan 20, 18:45PM",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5cqFuNuQc-evg5bzAK6Ro5ObXPyuPf4EgYQ&usqp=CAU",
          ),
          callCard(
            "Adam",
            Icons.call_made,
            secondary,
            "Jan 18, 15:30PM",
            "https://4bgowik9viu406fbr2hsu10z-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Portrait_5-1.jpg",
          ),
          callCard(
            "Jack",
            Icons.call_made,
            secondary,
            "Jan 17, 18:20PM",
            "https://upload.wikimedia.org/wikipedia/commons/2/23/Photo_portrait_PP.jpg",
          ),
          callCard(
            "Edward",
            Icons.call_missed,
            red,
            "Jan 15, 11:30AM",
            "https://ebizfiling.com/wp-content/uploads/2017/12/images_20-3.jpg",
          ),
          callCard(
            "Harry",
            Icons.call_missed,
            red,
            "Jan 15, 11:30AM",
            "https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: one,
        child: Icon(
          Icons.add_call,
          color: white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return SelectContact();
              },
            ),
          );
        },
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
        backgroundColor: grey,
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
