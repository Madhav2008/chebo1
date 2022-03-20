// // ignore_for_file: prefer_const_constructors, prefer_void_to_null, prefer_const_constructors_in_immutables

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:whatsapp/Screens/No_Connection_Screen/No_Connection_Screen.dart';
// import 'package:whatsapp/Screens/Splash_Screen/Splash_Screen.dart';
// import 'Language/Language.dart';
// import 'Theme/Provider/Theme_Provider.dart';

// late List<CameraDescription> cameras;
// Future<Null> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras = await availableCameras();
//   runApp(
//     MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   MyApp({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) {
//         return ThemeProvider();
//       },
//       builder: (context, _) {
//         final themeProvider = Provider.of<ThemeProvider>(context);
//         return ChangeNotifierProvider(
//           create: (context) {
//             ConnectivityChangeNotifier changeNotifier =
//                 ConnectivityChangeNotifier();
//             changeNotifier.initialLoad();
//             return changeNotifier;
//           },
//           child: GetMaterialApp(
//             translations: LocalString(),
//             locale: Locale('en', 'US'),
//             title: 'WhatsApp India',
//             debugShowCheckedModeBanner: false,
//             themeMode: themeProvider.themeMode,
//             theme: MyThemes.lightTheme,
//             darkTheme: MyThemes.darkTheme,
//             home:
//                 //  NavigationScreen(
//                 //   cameras: cameras,
//                 //   name: 'Madhav Arora',
//                 //   avatar:
//                 //       'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
//                 //   phoneno: '9999348666',
//                 //   countryCode: '+91',
//                 //   about: '👋🏻 Hey! there I am using WhatsApp India.',
//                 // ),
//                 SplashScreen(),
//           ),
//         );
//       },
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_void_to_null, prefer_const_constructors_in_immutables

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Screens/Splash_Screen/Splash_Screen.dart';
import 'Language/Language.dart';
import 'Theme/Provider/Theme_Provider.dart';
import 'package:firebase_core/firebase_core.dart';

late List<CameraDescription> cameras;
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
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
            title: 'WhatsApp India',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: SplashScreen(),
          );
        },
      );
}
