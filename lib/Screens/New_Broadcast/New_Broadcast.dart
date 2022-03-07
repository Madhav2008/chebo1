// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Contact_Model.dart';
import 'package:whatsapp/Widgets/Avatar_Card.dart';
import 'package:whatsapp/Widgets/Contact_Card.dart';

class NewBroadcast extends StatefulWidget {
  NewBroadcast({Key? key}) : super(key: key);

  @override
  _NewBroadcastState createState() => _NewBroadcastState();
}

class _NewBroadcastState extends State<NewBroadcast> {
  List<ChatModel> contacts = [
    ChatModel(name: "Bobby Arora", status: "About...."),
    ChatModel(name: "Sonia Arora", status: "About...."),
    ChatModel(name: "Tripta Arora", status: "About...."),
    ChatModel(name: "Bunty Arora", status: "About...."),
    ChatModel(name: "Vijay Arora", status: "About...."),
    ChatModel(name: "Pushpa Arora", status: "About...."),
    ChatModel(name: "JC Arora", status: "About...."),
    ChatModel(name: "Vidhi Arora", status: "About...."),
    ChatModel(name: "Siddhu Arora", status: "About...."),
    ChatModel(name: "Nisha Arora", status: "About...."),
    ChatModel(name: "Raghu Arora", status: "About...."),
  ];
  List<ChatModel> broadcastmember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New broadcast",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Add participants",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 26,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: broadcastmember.isNotEmpty ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (contacts[index - 1].select == true) {
                        broadcastmember.remove(contacts[index - 1]);
                        contacts[index - 1].select = false;
                      } else {
                        broadcastmember.add(contacts[index - 1]);
                        contacts[index - 1].select = true;
                      }
                    });
                  },
                  child: ContactCard(
                    contact: contacts[index - 1],
                  ),
                );
              }),
          broadcastmember.isNotEmpty
              ? Align(
                  child: Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              if (contacts[index].select == true)
                                // ignore: curly_braces_in_flow_control_structures
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      broadcastmember.remove(contacts[index]);
                                      contacts[index].select = false;
                                    });
                                  },
                                  child: AvatarCard(
                                    chatModel: contacts[index],
                                  ),
                                );
                              return Container();
                            }),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                  alignment: Alignment.topCenter,
                )
              : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: one,
        onPressed: () {
          broadcastmember.length > 1
              ? Navigator.pop(context)
              :
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("At least 2 contact must be selected"),
                  ),
                );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
