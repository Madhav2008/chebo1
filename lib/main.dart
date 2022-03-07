// ignore_for_file: prefer_const_constructors, prefer_void_to_null, prefer_const_constructors_in_immutables

import 'package:camera/camera.dart';
// import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
// import 'package:whatsapp/Screens/Navigation/Navigation.dart';
// import 'package:whatsapp/Screens/Security_Screen/Security_Screen.dart';
import 'package:whatsapp/Screens/Splash_Screen/Splash_Screen.dart';
import 'Language/Language.dart';
import 'Theme/Provider/Theme_Provider.dart';

late List<CameraDescription> cameras;
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return GetMaterialApp(
            translations: LocalString(),
            locale: Locale('en', 'US'),
            title: 'WhatsApp',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home:
                //  StreamBuilder(
                //   stream: Connectivity().onConnectivityChanged,
                //   builder: (BuildContext context,
                //       AsyncSnapshot<ConnectivityResult> snapshot) {
                //     if (snapshot != null &&
                //         snapshot.hasData &&
                //         snapshot.data != ConnectivityResult.none) {
                //       //  SecurityScreen(),
                // return
                SplashScreen(),
            // } else {
            // return SecurityScreen();
            // }
            // },
            // ),
          );
        },
      );
}
