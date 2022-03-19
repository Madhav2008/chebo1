// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Country_Model.dart';
import 'package:whatsapp/Screens/Country_Screen/Country_Screen.dart';
import 'package:whatsapp/Screens/Navigation/Navigation.dart';
import 'package:whatsapp/Screens/OTP_Verification_Screen/OTP_Verification_Screen.dart';
import 'package:whatsapp/Screens/Problem_Detected_Screen/Problem_Detected_Screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String countryName = 'India';
  String countryCode = '+91';
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // late String smsOTP;
  // late String verificationId;
  // String errorMessage = '';

  // Future<void> verifyPhone() async {
  //   final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
  //     verificationId = verId;
  //     smsOTPDialog(context).then((value) {
  //       print('sign in');
  //     });
  //   } as PhoneCodeSent;
  //   try {
  //     await _auth.verifyPhoneNumber(
  //         phoneNumber: _phoneController.text, // PHONE NUMBER TO SEND OTP
  //         codeAutoRetrievalTimeout: (String verId) {
  //           //Starts the phone number verification process for the given phone number.
  //           //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
  //           verificationId = verId;
  //         },
  //         codeSent:
  //             smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
  //         timeout: Duration(seconds: 20),
  //         verificationCompleted: (AuthCredential phoneAuthCredential) {
  //           print(phoneAuthCredential);
  //         },
  //         verificationFailed: (AuthException exceptio) {
  //           print('${exceptio.message}');
  //         });
  //   } catch (e) {
  //     // handleError(e);
  //   }
  // }

  // Future smsOTPDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Enter SMS Code'),
  //           content: Container(
  //             height: 85,
  //             child: Column(children: [
  //               TextField(
  //                 onChanged: (value) {
  //                   smsOTP = value;
  //                 },
  //               ),
  //               (errorMessage != ''
  //                   ? Text(
  //                       errorMessage,
  //                       style: TextStyle(color: Colors.red),
  //                     )
  //                   : Container())
  //             ]),
  //           ),
  //           contentPadding: EdgeInsets.all(10),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('Done'),
  //               onPressed: () {
  //                 _auth.currentUser.then((user) {
  //                   if (user != null) {
  //                     Navigator.of(context).pop();
  //                     Navigator.of(context).pushReplacement(
  //                       MaterialPageRoute(
  //                         builder: (builder) => NavigationScreen(
  //                           cameras: [],
  //                           name: 'ed',
  //                           avatar: 'de',
  //                           phoneno: 'ed',
  //                           countryCode: countryCode,
  //                           about: 'de',
  //                         ),
  //                       ),
  //                     );
  //                   } else {
  //                     signIn();
  //                   }
  //                 });
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  // signIn() async {
  //   try {
  //     final AuthCredential credential = PhoneAuthProvider.getCredential(
  //       verificationId: verificationId,
  //       smsCode: smsOTP,
  //     );
  //     final FirebaseUser user = await _auth.signInWithCredential(credential);
  //     final FirebaseUser currentUser = await _auth.currentUser;
  //     assert(user.uid == currentUser.uid);
  //     Navigator.of(context).pop();
  //     Navigator.of(context).pushReplacementNamed('/homepage');
  //   } catch (e) {
  //     // handleError(e);
  //   }
  // }

  // handleError(PlatformException error) {
  //   print(error);
  //   switch (error.code) {
  //     case 'ERROR_INVALID_VERIFICATION_CODE':
  //       FocusScope.of(context).requestFocus(new FocusNode());
  //       setState(() {
  //         errorMessage = 'Invalid Code';
  //       });
  //       Navigator.of(context).pop();
  //       smsOTPDialog(context).then((value) {
  //         print('sign in');
  //       });
  //       break;
  //     default:
  //       setState(() {
  //         errorMessage = error.message!;
  //       });

  //       break;
  //   }
  // }

  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        title: Text(
          'Enter your phone number',
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
            ),
            onSelected: (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => ProblemDetectedScreen(),
                ),
              );
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Text(
                'WhatsApp India will send an SMS message to verify your phone number.',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (builder) => _whatsMyNo(context),
                );
              },
              child: Text(
                "What's my number?",
                style: TextStyle(
                  color: one,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => CountryScreen(
                      setCountryData: setCountryData,
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.5,
                      color: one,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            countryName,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: one,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 90,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.5,
                          color: one,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        countryCode,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 180,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: one,
                        ),
                      ),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      maxLength: 10,
                      autofocus: true,
                      cursorColor: one,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        hintText: 'phone number',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Carrier SMS charges may apply",
              style: TextStyle(
                color: grey,
                fontSize: 17,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
              ),
            ),
            GestureDetector(
              onTap: () {
                _phoneController.text.length < 10
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Phone no. is required"),
                        ),
                      )
                    : showDialog(
                        context: context,
                        builder: (BuildContext context) => _nextDialog(context),
                      );
              },
              child: Container(
                color: one,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,
                  ),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 17,
                      color: white,
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
    );
  }

  Widget _nextDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        "You entered the phone number:",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              countryCode + ' ' + _phoneController.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Is this OK, or would you like to edit the number?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'EDIT',
                    style: TextStyle(
                      color: one,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return OTPVerificationScreen(
                            no: _phoneController.text,
                            countryCode: countryCode,
                            country: countryName,
                          );
                        },
                      ),
                    );
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: one,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _whatsMyNo(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: one,
              height: 70,
              child: Center(
                child: Icon(
                  Icons.phone,
                  color: white,
                  size: 30,
                ),
              ),
            ),
            Text(
              countryCode + ' ' + _phoneController.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Is this OK, or would you like to edit the number?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'EDIT',
                    style: TextStyle(
                      color: one,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OTPVerificationScreen(
                          no: _phoneController.text,
                          countryCode: countryCode,
                          country: countryName,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: one,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }
}
