// // ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:whatsapp/Auth/Auth_Services.dart';
// import 'package:whatsapp/Constants/Constants.dart';
// import 'package:whatsapp/New/Forget.dart';
// import 'package:whatsapp/New/Register.dart';
// import 'package:whatsapp/Screens/Payment_Screen/Payment_Screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _visible = false;

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   static Future<User?> loginUsingEmailAndPassword({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "user-not-found") {
//         showDialog(
//           context: context,
//           builder: (con) {
//             return AlertDialog(
//               title: Text("Error"),
//               content: Text("No User Found!!"),
//             );
//           },
//         );
//       }
//     }
//     return user;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(
//       Duration(milliseconds: 100),
//       () {
//         setState(() {
//           _visible = true;
//         });
//       },
//     );
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: AnimatedOpacity(
//           opacity: _visible ? 1.0 : 0.0,
//           duration: Duration(seconds: 1),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//                 // image: DecorationImage(
//                 //   image: AssetImage('assets/images/Login.png'),
//                 //   fit: BoxFit.cover,
//                 // ),
//                 ),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xFF101D24),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 10.0),
//                     child: Image.asset(
//                       "../assets/images/WhatsAppIndiaLogo.png",
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                   Text(
//                     'WhatsApp India',
//                     style: TextStyle(
//                       fontSize: 40.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 70),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40.0),
//                     child: TextField(
//                       controller: emailController,
//                       style: TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: one,
//                             width: 0.0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: one,
//                             width: 0.0,
//                           ),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.mail,
//                           color: Colors.white,
//                         ),
//                         hintText: 'Email',
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                         ),
//                         fillColor: Colors.white,
//                         focusColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40.0),
//                     child: TextField(
//                       obscureText: true,
//                       controller: passwordController,
//                       style: TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: one,
//                             width: 0.0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: one,
//                             width: 0.0,
//                           ),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.lock,
//                           color: Colors.white,
//                         ),
//                         hintText: 'Password',
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                         ),
//                         fillColor: Colors.white,
//                         focusColor: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 180),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ForgetScreen(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Forget password?',
//                         style: TextStyle(
//                           color: one,
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Center(
//                     child: GestureDetector(
//                       onTap: () async {
//                         User? user = await loginUsingEmailAndPassword(
//                           email: emailController.text,
//                           password: passwordController.text,
//                           context: context,
//                         );

//                         if (user != null) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => PaymentScreen(),
//                             ),
//                           );
//                         }
//                         //     Provider.of<AuthService>(context)
//                         //         .signInWithEmailAndPassword(
//                         //             emailController.text, passwordController.text)
//                         //         .then((auth) {
//                         //       Navigator.pushReplacement(
//                         //           context,
//                         //           MaterialPageRoute(
//                         //               builder: (context) => PaymentScreen()));
//                         //       // Fluttertoast.showToast(
//                         //       //     msg: "Login Successfully!!",
//                         //       //     toastLength: Toast.LENGTH_SHORT,
//                         //       //     gravity: ToastGravity.BOTTOM);
//                         //     }).catchError((error) {
//                         //       showDialog(
//                         //           context: context,
//                         //           builder: (con) {
//                         //             return AlertDialog(
//                         //               title: Text("Error"),
//                         //               content: Text(error.toString()),
//                         //             );
//                         //           });
//                         //     });
//                       },
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.5,
//                         height: 50,
//                         // child: RaisedButton(
//                         //   color: one,
//                         //   onPressed: () async {
//                         //     User? user = await loginUsingEmailAndPassword(
//                         //       email: emailController.text,
//                         //       password: passwordController.text,
//                         //       context: context,
//                         //     );

//                         //     if (user != null) {
//                         //       Navigator.push(
//                         //         context,
//                         //         MaterialPageRoute(
//                         //           builder: (context) => PaymentScreen(),
//                         //         ),
//                         //       );
//                         //     }
//                         //     // Provider.of<AuthService>(context)
//                         //     //     .signInWithEmailAndPassword(
//                         //     //   emailController.text,
//                         //     //   passwordController.text,
//                         //     // )
//                         //     //     .then((auth) {
//                         //     // Navigator.pushReplacement(
//                         //     //   context,
//                         //     //   MaterialPageRoute(
//                         //     //     builder: (context) => PaymentScreen(),
//                         //     //   ),
//                         //     // );
//                         //     //   // showDialog(
//                         //     //   //   context: context,
//                         //     //   //   builder: (con) {
//                         //     //   //     return AlertDialog(
//                         //     //   //       title: Text("Congratulations!"),
//                         //     //   //       content: Text('Login Successfully'),
//                         //     //   //     );
//                         //     //   //   },
//                         //     //   // );
//                         //     // }).catchError((error) {
//                         //     //   showDialog(
//                         //     //     context: context,
//                         //     //     builder: (con) {
//                         //     //       return AlertDialog(
//                         //     //         title: Text("Error"),
//                         //     //         content: Text(
//                         //     //           error.toString(),
//                         //     //         ),
//                         //     //       );
//                         //     //     },
//                         //     //   );
//                         //     // });
//                         //   },
//                         child: Text(
//                           'Login',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                     // ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Create new account?',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 17,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => RegisterScreen(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           'Register',
//                           style: TextStyle(
//                             color: one,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

// import 'package:firebase_app_web/Service/Auth_Service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Auth/Auth_Services.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_field_style.dart';
// import 'package:otp_text_field/style.dart';

class PhoneAuthPage extends StatefulWidget {
  PhoneAuthPage({Key? key}) : super(key: key);

  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  int start = 30;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  // Auth auth = ;
  String verificationIdFinal = "";
  String smsCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "SignUp",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              textField(),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    Text(
                      "Enter 6 digit OTP",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              otpField(),
              SizedBox(
                height: 40,
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "Send OTP again in ",
                    style: TextStyle(fontSize: 16, color: Colors.yellowAccent),
                  ),
                  TextSpan(
                    text: "00:$start",
                    style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                  ),
                  TextSpan(
                    text: " sec ",
                    style: TextStyle(fontSize: 16, color: Colors.yellowAccent),
                  ),
                ],
              )),
              SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () {
                  authClass.signInwithPhoneNumber(
                      verificationIdFinal, smsCode, context);
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      color: Color(0xffff9601),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Lets Go",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xfffbe2ae),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 58,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Color(0xff1d1d1d),
        borderColor: Colors.white,
      ),
      style: TextStyle(fontSize: 17, color: Colors.white),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  Widget textField() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xff1d1d1d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: phoneController,
        style: TextStyle(color: Colors.white, fontSize: 17),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your phone Number",
          hintStyle: TextStyle(color: Colors.white54, fontSize: 17),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              " (+91) ",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? null
                : () async {
                    setState(() {
                      start = 30;
                      wait = true;
                      buttonName = "Resend";
                    });
                    await authClass.verifyPhoneNumber(
                        "+91 ${phoneController.text}", context, setData);
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                buttonName,
                style: TextStyle(
                  color: wait ? Colors.grey : Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}
