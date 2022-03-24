// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Auth/Auth_Services.dart';
import 'package:whatsapp/Auth/User_Model.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Chat_Model.dart';
import 'package:whatsapp/Screens/Landing_Page/Landing_Page.dart';
import 'package:whatsapp/Screens/Navigation/Navigation.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
    required this.sourceChat,
    required this.chatModels,
  }) : super(key: key);

  final ChatModel sourceChat;
  final List<ChatModel> chatModels;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null
              ? LandingPage()
              : NavigationScreen(
                  cameras: [],
                  name: 'Madhav Arora',
                  about: '👋🏻 Hey! there I am using WhatsApp India.',
                  avatar:
                      'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
                  countryCode: '+91',
                  phoneno: '9999348444',
                  sourceChat: sourceChat,
                  chatModels: chatModels,
                );
        } else {
          return Scaffold(
            body: Center(
              child: SpinKitFadingCube(
                size: 50,
                color: one,
              ),
            ),
          );
        }
      },
    );
  }
}
