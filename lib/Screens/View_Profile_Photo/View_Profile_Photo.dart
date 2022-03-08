// ignore_for_file: file_names, prefer_const_constructors

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/No_Connection/No_Connection.dart';

class ViewProfilePhoto extends StatelessWidget {
  const ViewProfilePhoto({
    Key? key,
    required this.name,
    required this.avatar,
  }) : super(key: key);

  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
        ),
      ),
      body: Center(
        child: Container(
          color: grey,
          child: StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (BuildContext context,
                AsyncSnapshot<ConnectivityResult> snapshot) {
              if (snapshot != null &&
                  snapshot.hasData &&
                  snapshot.data != ConnectivityResult.none) {
                return InteractiveViewer(
                  panEnabled: false,
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 1,
                  maxScale: 2,
                  child: Image.network(
                    avatar,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return NoConnection(
                  image: '../assets/images/2.png',
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
