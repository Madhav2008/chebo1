// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/My_QR_Code_Screen/My_QR_Code_Screen.dart';
import 'package:whatsapp/Screens/Scan_QR_Code/Scan_QR_Code.dart';

class QRCodeScreen extends StatefulWidget {
  QRCodeScreen({
    Key? key,
    required this.name,
    required this.avatar,
  }) : super(key: key);

  final String name;
  final String avatar;

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR code"),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                'Add me as a contact on WhatsApp. https://wa.me/qr/GAGIEKDKP3THE1',
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("Reset QR code"),
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: one,
          labelColor: white,
          unselectedLabelColor: grey,
          tabs: [
            Tab(
              text: "MY CODE",
            ),
            Tab(
              text: "SCAN CODE",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          MyQRCodeScreen(
            name: widget.name,
            avatar: widget.avatar,
          ),
          ScanQRCodeScreen(
            cameras: [],
          ),
        ],
      ),
    );
  }
}
