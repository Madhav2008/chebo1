// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Navigation/Navigation.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({
    Key? key,
    required this.no,
    required this.countryCode,
  }) : super(key: key);

  final String no;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phonenoController = TextEditingController(
      text: no,
    );

    var avatar = '../assets/images/noProfile.png';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: grey,
                backgroundImage: NetworkImage(
                  avatar,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: grey,
                size: 25,
              ),
              title: Text(
                "Name",
                style: TextStyle(
                  color: grey,
                  fontSize: 17,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: one,
                        ),
                      ),
                    ),
                    child: TextField(
                      controller: _nameController,
                      autofocus: true,
                      cursorColor: one,
                      maxLength: 17,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
              ),
            ),
            GestureDetector(
              onTap: () {
                _nameController.text.isEmpty
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Name is required"),
                        ),
                      )
                    : FirebaseAuth.instance.currentUser!.updateProfile(
                        displayName: _nameController.text,
                      );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => NavigationScreen(
                      cameras: [],
                      name: _nameController.text,
                      avatar: avatar,
                      phoneno: _phonenoController.text,
                      about: '👋🏻 Hey! there I am using WhatsApp India.',
                      countryCode: countryCode,
                    ),
                  ),
                );
              },
              child: Container(
                color: one,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,
                  ),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 17,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
