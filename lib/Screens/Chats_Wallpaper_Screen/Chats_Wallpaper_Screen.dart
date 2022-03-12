// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Theme/Provider/Theme_Provider.dart';

class ChatsWallpaperScreen extends StatelessWidget {
  ChatsWallpaperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? "Dark Theme Wallpaper"
            : "Light Theme Wallpaper";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBar,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('../assets/images/background.png'),
        ],
      ),
    );
  }
}
