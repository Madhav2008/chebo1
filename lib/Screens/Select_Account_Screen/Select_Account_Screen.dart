// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:whatsapp/Models/Chat_Model.dart';

class SelectAccountScreen extends StatefulWidget {
  SelectAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectAccountScreen> createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {
  @override
  Widget build(BuildContext context) {
    // ChatModel sourceChat;
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Container(
                width: 270,
                height: 65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      '../assets/images/google_signin_button.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(1.0,))
            ],
          ),
        ),
      ),
      // ListView.builder(
      //   itemCount: dummyData.length,
      //   itemBuilder: (
      //     context,
      //     index,
      //   ) {
      //     return InkWell(
      //       onTap: () {
      //         sourceChat = dummyData.removeAt(index);
      //         Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(
      //             builder: (builder) => NavigationScreen(
      //               cameras: [],
      //               name: dummyData[index].name,
      //               avatar: dummyData[index].avatarUrl,
      //               phoneno: dummyData[index].phoneno,
      //               countryCode: '+91',
      //               about: dummyData[index].about,
      //               sourceChat: sourceChat,
      //               chatModels: dummyData,
      //             ),
      //           ),
      //         );
      //       },
      //       child: ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(
      //             Icons.person,
      //             color: white,
      //             size: 30,
      //           ),
      //           backgroundColor: one,
      //         ),
      //         title: Text(dummyData[index].name),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
