// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProblemDetectedScreen extends StatefulWidget {
  const ProblemDetectedScreen({Key? key}) : super(key: key);

  @override
  State<ProblemDetectedScreen> createState() => _ProblemDetectedScreenState();
}

class _ProblemDetectedScreenState extends State<ProblemDetectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem detected'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
