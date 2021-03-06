// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class ForgetScreen extends StatefulWidget {
  ForgetScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgetScreen> {
  bool _visible = false;
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        setState(() {
          _visible = true;
        });
      },
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('assets/images/Login.png'),
              //   fit: BoxFit.cover,
              // ),s
              ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF101D24),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 45.0,
                      ),
                      Text(
                        'Forget Password',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 150),
                Text(
                  "Enter your email and will send\nyou instructions on how to reset it",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 55),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: one, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: one, width: 0.0),
                      ),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      // send();
                      // Fluttertoast.showToast(
                      //   msg: "Mail Sent Successfully!!",
                      //   toastLength: Toast.LENGTH_SHORT,
                      //   gravity: ToastGravity.BOTTOM,
                      // );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      child: RaisedButton(
                        color: one,
                        onPressed: () {},
                        child: Text(
                          'Send',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
