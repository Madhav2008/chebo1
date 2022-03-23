// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Auth/Auth_Services.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/New/Forget.dart';
import 'package:whatsapp/New/Register.dart';
import 'package:whatsapp/Screens/Payment_Screen/Payment_Screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _visible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        setState(() {
          _visible = true;
        });
      },
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage('assets/images/Login.png'),
                //   fit: BoxFit.cover,
                // ),
                ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF101D24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Image.asset(
                      "../assets/images/WhatsAppIndiaLogo.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Text(
                    'WhatsApp India',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 70),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: one,
                            width: 0.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: one,
                            width: 0.0,
                          ),
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
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: one,
                            width: 0.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: one,
                            width: 0.0,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 180),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget password?',
                        style: TextStyle(
                          color: one,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    // child: GestureDetector(
                    //   onTap: () async {
                    //     Provider.of<AuthService>(context)
                    //         .signInWithEmailAndPassword(
                    //             emailController.text, passwordController.text)
                    //         .then((auth) {
                    //       Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => PaymentScreen()));
                    //       // Fluttertoast.showToast(
                    //       //     msg: "Login Successfully!!",
                    //       //     toastLength: Toast.LENGTH_SHORT,
                    //       //     gravity: ToastGravity.BOTTOM);
                    //     }).catchError((error) {
                    //       showDialog(
                    //           context: context,
                    //           builder: (con) {
                    //             return AlertDialog(
                    //               title: Text("Error"),
                    //               content: Text(error.toString()),
                    //             );
                    //           });
                    //     });
                    //   },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      child: RaisedButton(
                        color: one,
                        onPressed: () async {
                          Provider.of<AuthService>(context)
                              .signInWithEmailAndPassword(
                                  emailController.text, passwordController.text)
                              .then((auth) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(),
                              ),
                            );
                            showDialog(
                              context: context,
                              builder: (con) {
                                return AlertDialog(
                                  title: Text("Congratulations!"),
                                  content: Text(
                                    'Login Successfully'
                                  ),
                                );
                              },
                            );
                          }).catchError((error) {
                            showDialog(
                              context: context,
                              builder: (con) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text(
                                    error.toString(),
                                  ),
                                );
                              },
                            );
                          });
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create new account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: one,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
