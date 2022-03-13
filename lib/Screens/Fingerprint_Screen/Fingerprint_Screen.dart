// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class FingerprintScreen extends StatefulWidget {
  FingerprintScreen({Key? key}) : super(key: key);

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  bool fingerprintL = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fingerprint lock',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(
            'Unlock with fingerprint',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            "When enabled, you'll need to use fingerprint to open WhatsApp India. You can still answer calls if WhatsApp India is locked.",
            style: TextStyle(
              color: grey,
              fontSize: 17,
            ),
          ),
          trailing: Switch(
            value: fingerprintL,
            onChanged: (value) {
              setState(() {
                fingerprintL = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
