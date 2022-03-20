// import 'package:Foodybite/auth/auth_services.dart';
// import 'package:Foodybite/auth/user_model.dart';
// import 'package:Foodybite/screens/navigation_screen/navigation_screen.dart';
// import 'package:Foodybite/screens/welcome_screen/welcome_screen.dart';

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Auth/Auth_Services.dart';
import 'package:whatsapp/Auth/User_Model.dart';
import 'package:whatsapp/Screens/Landing_Page/Landing_Page.dart';
import 'package:whatsapp/Screens/Navigation/Navigation.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_,AsyncSnapshot<User?>snapshot){
        if(snapshot.connectionState==ConnectionState.active){
          final User?user=snapshot.data;
          return user == null ? LandingPage() : NavigationScreen(cameras: [],);
        } else {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}