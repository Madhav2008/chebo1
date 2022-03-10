// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Navigation/Navigation.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({
    Key? key,
    required this.no,
  }) : super(key: key);

  final String no;

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _aboutController = TextEditingController();
    TextEditingController _phonenoController = TextEditingController(
      text: no,
    );

    // final avatar =
    //     'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png';

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
              // onTap: () {
              // showModalBottomSheet(
              //   backgroundColor: Colors.transparent,
              //   context: context,
              //   builder: (builder) => bottomSheet1(context),
              // );
              // },
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
                  TextField(
                    controller: _nameController,
                    autofocus: true,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Text(
                  //   'This is not your username or pin. This name will be visible to your WhatsApp contacts.',
                  //   style: TextStyle(
                  //     color: grey,
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  // Divider(
                  //   thickness: 1,
                  // ),
                ],
              ),
              // trailing: Icon(
              //   Icons.edit,
              //   color: one,
              //   size: 25,
              // ),
            ),
            ListTile(
              // onTap: () {
              // showModalBottomSheet(
              //   backgroundColor: Colors.transparent,
              //   context: context,
              //   builder: (builder) => bottomSheet1(context),
              // );
              // },
              leading: Icon(
                Icons.info_outline,
                color: grey,
                size: 25,
              ),
              title: Text(
                "About",
                style: TextStyle(
                  color: grey,
                  fontSize: 17,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _aboutController,
                    autofocus: true,
                    style: TextStyle(
                      fontSize: 18,
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
                          content: Text("All fields are required"),
                        ),
                      )
                    : _aboutController.text.isEmpty
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("All fields are required"),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => NavigationScreen(
                                cameras: [],
                                name: _nameController.text,
                                avatar: avatar,
                                phoneno: _phonenoController.text,
                                about: _aboutController.text,
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
