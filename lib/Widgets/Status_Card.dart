// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class StatusCard extends StatefulWidget {
  StatusCard({
    Key? key,
    required this.name,
    required this.time,
    required this.image,
    required this.isSeen,
    required this.statusNum,
  }) : super(key: key);

  final String name;
  final String time;
  final String image;
  final bool isSeen;
  final int statusNum;

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusPainter(
          isSeen: widget.isSeen,
          StatusNum: widget.statusNum,
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            widget.image,
          ),
          backgroundColor: grey,
        ),
      ),
      title: Text(
        widget.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.time,
        style: TextStyle(
        ),
      ),
      // onTap: () {},
    );
  }
}

degreeToAngle(double degree) {
  return degree * pi / 180;
}

class StatusPainter extends CustomPainter {
  bool isSeen;
  int StatusNum;
  StatusPainter({
    required this.isSeen,
    required this.StatusNum,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = isSeen ? grey : one
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    if (StatusNum == 1) {
      canvas.drawArc(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        degreeToAngle(0),
        degreeToAngle(360),
        false,
        paint,
      );
    } else {
      double degree = -90;
      double arc = 360 / StatusNum;
      for (int i = 0; i < StatusNum; i++) {
        canvas.drawArc(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(degree + 4),
          degreeToAngle(arc - 8),
          false,
          paint,
        );
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
