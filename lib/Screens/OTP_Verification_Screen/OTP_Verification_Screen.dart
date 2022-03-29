// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Login_Screen/Login_Screen.dart';
import 'package:whatsapp/Screens/User_Details_Screen/User_Details_Screen.dart';

enum Status { Waiting, Error }

class OTPVerificationScreen extends StatefulWidget {
  OTPVerificationScreen({
    Key? key,
    required this.no,
    required this.countryCode,
    required this.country,
  }) : super(key: key);

  final String no;
  final String countryCode;
  final String country;

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState(no);
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  // String? verificationCode = '123456';

  final phoneNumber;
  var _status = Status.Error;
  var _verificationId;
  TextEditingController _textEditingController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  _OTPVerificationScreenState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
    // verifyPhoneNumber();
  }

  Future _verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phonesAuthCredentials) async {},
      verificationFailed: (verificationFailed) async {},
      codeSent: (verificationId, resendingToken) async {
        setState(() {
          this._verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  Future _sendCodeToFirebase({String? code}) async {
    if (this._verificationId != null) {
      var credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: code!,
      );
      await _auth
          .signInWithCredential(credential)
          .then((value) {})
          .whenComplete(
            () => null,
          )
          .onError(
            (error, stackTrace) {},
          );
    }
  }

  // verifyPhoneNumber() async {
  //   try {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: '+91 9999348444',
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance
  //             .signInWithCredential(credential)
  //             .then((value) {
  //           if (value.user != null) {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (builder) => UserDetailsScreen(
  //                   no: widget.no,
  //                   countryCode: widget.countryCode,
  //                 ),
  //               ),
  //             );
  //           }
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         if (e.code == 'invalid-phone-number') {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(
  //               content: Text(
  //                 e.message.toString(),
  //               ),
  //             ),
  //           );
  //         }
  //       },
  //       codeSent: (String vId, int? ResentToken) async {
  //         setState(() {
  //           verificationCode = vId;
  //         });
  //         String smsCode = '123456';
  //         PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //             verificationId: vId, smsCode: smsCode);
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //       },
  //       codeAutoRetrievalTimeout: (String vId) {
  //         setState(() {
  //           verificationCode = vId;
  //         });
  //       },
  //       timeout: Duration(seconds: 60),
  //     );
  //     // await FirebaseAuth.instance.verifyPhoneNumber(
  //     // phoneNumber: '+91 9971271272',
  //     // verificationCompleted: (PhoneAuthCredential credential) {},
  //     // verificationFailed: (FirebaseAuthException e) {},
  //     // codeSent: (String verificationId, int? resendToken) {},
  //     // codeAutoRetrievalTimeout: (String verificationId) {},
  //     // );
  //   } catch (e) {
  //     FocusScope.of(context).unfocus();
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Invalid OTP'),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        title: Text(
          'Verify +91 ' + widget.no,
          style: TextStyle(
            fontSize: 20,
            color: one,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.more_vert_outlined,
              // color: white,
            ),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            },
          ),
        ],
      ),
      body: _status != Status.Error
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  "Enter OTP sent to",
                ),
                Text(
                  phoneNumber == null ? "" : phoneNumber,
                ),
                TextField(
                  onChanged: (value) {
                    print(value);
                    if (value.length == 6) {}
                  },
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 30,
                    fontSize: 30,
                  ),
                  maxLength: 6,
                  controller: _textEditingController,
                  keyboardType: TextInputType.number,
                  autofillHints: <String>[
                    AutofillHints.telephoneNumber,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't receive a OTP?"),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Resend OTP'),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  "The code used is invalid!",
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Edit Number',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Code',
                  ),
                ),
              ],
            ),
      // Center(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(
      //           left: 10.0,
      //           right: 10.0,
      //         ),
      //         child: Text(
      //           'We have sent a SMS with a code to ' +
      //               widget.countryCode +
      //               ' ' +
      //               widget.no,
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (builder) => LoginScreen(),
      //             ),
      //           );
      //         },
      //         child: Text(
      //           "Wrong number?",
      //           style: TextStyle(
      //             color: one,
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 50,
      //       ),
      //       Container(
      //         padding: EdgeInsets.all(10),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(12),
      //         ),
      //         child: Column(
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 _textFieldOTPVerificationScreen(
      //                   first: true,
      //                   last: false,
      //                 ),
      //                 _textFieldOTPVerificationScreen(
      //                   first: false,
      //                   last: false,
      //                 ),
      //                 _textFieldOTPVerificationScreen(
      //                   first: false,
      //                   last: false,
      //                 ),
      //                 _textFieldOTPVerificationScreen(
      //                   first: false,
      //                   last: false,
      //                 ),
      //                 _textFieldOTPVerificationScreen(
      //                   first: false,
      //                   last: false,
      //                 ),
      //                 _textFieldOTPVerificationScreen(
      //                   first: false,
      //                   last: true,
      //                 ),
      //               ],
      //             ),
      //             SizedBox(
      //               height: 15,
      //             ),
      //             Text(
      //               'Enter 6-digit code',
      //               style: TextStyle(
      //                 color: grey,
      //                 fontSize: 20,
      //               ),
      //             ),
      //             SizedBox(
      //               height: 30,
      //             ),
      //             ListTile(
      //               onTap: () {
      //                 ScaffoldMessenger.of(context).showSnackBar(
      //                   SnackBar(
      //                     content: Text("OTP resent"),
      //                   ),
      //                 );
      //               },
      //               leading: Icon(
      //                 Icons.chat,
      //                 color: one,
      //                 size: 25,
      //               ),
      //               title: Text(
      //                 'Resend SMS',
      //                 style: TextStyle(
      //                   color: one,
      //                   fontSize: 20,
      //                 ),
      //               ),
      //             ),
      //             Divider(
      //               thickness: 2,
      //             ),
      //             ListTile(
      //               onTap: () {
      //                 ScaffoldMessenger.of(context).showSnackBar(
      //                   SnackBar(
      //                     content: Text("Call request sent"),
      //                   ),
      //                 );
      //               },
      //               leading: Icon(
      //                 Icons.call,
      //                 color: one,
      //                 size: 25,
      //               ),
      //               title: Text(
      //                 'Call me',
      //                 style: TextStyle(
      //                   color: one,
      //                   fontSize: 20,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: 100,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _textFieldOTPVerificationScreen({required bool first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: TextField(
          autofocus: true,
          onChanged: (value) async {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
            if (last == true) {
              // try {
              //   await FirebaseAuth.instance
              //       .signInWithCredential(
              //     PhoneAuthProvider.credential(
              //       verificationId: verificationCode!,
              //       smsCode: value,
              //     ),
              //   )
              //       .then((value) {
              //     if (value.user != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => UserDetailsScreen(
                    no: widget.no,
                    countryCode: widget.countryCode,
                  ),
                ),
              );
              //     }
              //   });
              // } catch (e) {
              //   FocusScope.of(context).unfocus();
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: Text('Invalid OTP'),
              //     ),
              //   );
              // }
              // verifyPhoneNumber();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: grey,
                width: 2,
                // color: white,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: one,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
