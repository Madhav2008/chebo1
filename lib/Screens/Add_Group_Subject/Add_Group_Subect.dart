// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Widgets/Avatar_Card.dart';
import 'package:whatsapp/Models/Contact_Model.dart';

class AddGroupSubject extends StatefulWidget {
  const AddGroupSubject({Key? key}) : super(key: key);

  @override
  _AddGroupSubjectState createState() => _AddGroupSubjectState();
}

class _AddGroupSubjectState extends State<AddGroupSubject> {
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
  List<ChatModel> groupmember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Add subject",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: one,
        onPressed: () {},
        child: Icon(Icons.check),
      ),
      body: Align(
        child: Column(
          children: [
            Container(
              height: 75,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  if (contacts[index].select == true)
                    // ignore: curly_braces_in_flow_control_structures
                    return InkWell(
                      onTap: () {
                        setState(() {
                          groupmember.remove(contacts[index]);
                          contacts[index].select = false;
                        });
                      },
                      child: AvatarCard(
                        chatModel: contacts[index],
                      ),
                    );
                  return Container();
                },
              ),
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
        alignment: Alignment.topCenter,
      ),
    );
  }
}
