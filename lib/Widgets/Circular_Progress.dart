// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:whatsapp/Constants/Constants.dart';

LoadingWhatsAppIndia() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(
      top: 12,
    ),
    child: SpinKitFadingCube(
      size: 50,
      color: one,
    ),
  );
}
