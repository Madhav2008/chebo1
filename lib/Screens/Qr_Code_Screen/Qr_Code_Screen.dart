// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
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
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller1;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller1!.pauseCamera();
    } else if (Platform.isIOS) {
      controller1!.resumeCamera();
    }
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
                'Add me as a contact on WhatsApp India. https://wa.me/qr/GAGIEKDKP3THE1',
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
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
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller1 = controller1;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller1?.dispose();
    super.dispose();
  }
}
