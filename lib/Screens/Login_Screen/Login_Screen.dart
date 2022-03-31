// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Country_Model.dart';
import 'package:whatsapp/Screens/Country_Screen/Country_Screen.dart';
// import 'package:whatsapp/Screens/Navigation/Navigation.dart';
import 'package:whatsapp/Screens/OTP_Verification_Screen/OTP_Verification_Screen.dart';
import 'package:whatsapp/Screens/Problem_Detected_Screen/Problem_Detected_Screen.dart';
// import 'package:whatsapp/Screens/User_Details_Screen/User_Details_Screen.dart';

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
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseAuth _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // if (_auth.currentUser != null) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (builder) => NavigationScreen(
    //         cameras: [],
    //         name: 'Madhav Arora',
    //         avatar:
    //             'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
    //         phoneno: '9999348666',
    //         countryCode: '+91',
    //         about: '👋🏻 Hey! there I am using WhatsApp India.',
    //       ),
    //     ),
    //   );
    // }
    // verifyPhone();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  // late String smsOTP;
  // late String verificationId;
  // String errorMessage = '';
  // String? verificationCode = '123456';

  // Future<void> verifyPhone() async {
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
  //                   no: _phoneController.text,
  //                   countryCode: countryCode,
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
  //       FocusScope.of(context).requestFocus(FocusNode());
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (builder) => CountryScreen(
                //       setCountryData: setCountryData,
                //     ),
                //   ),
                // );
                showCountryPicker(
                  context: context,
                  //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                  // exclude: <String>['KN', 'MF'],
                  //Optional. Shows phone code before the country name.
                  showPhoneCode: true,
                  onSelect: (Country country) {
                    setState(() {
                      countryName = country.name;
                      countryCode = '+' + country.phoneCode;
                    });
                    print(
                      'Display Name: ${country.displayName} Country Code: ${country.countryCode} DisPlay Name No Country Code: ${country.displayNameNoCountryCode}, E163 Key: ${country.e164Key}, E164 SC: ${country.e164Sc}, Example: ${country.example}, Full example with plus sign: ${country.fullExampleWithPlusSign}, Level: ${country.level}',
                    );
                  },
                  // Optional. Sets the the me for the country list picker.
                  countryListTheme: CountryListThemeData(
                    // Optional. Sets the border radius for the bottomsheet.
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    // Optional. Styles the search field.
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
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

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';
// import 'package:whatsapp/Screens/Navigation/Navigation.dart';
// // import 'package:phone_verification/registerScreen.dart';
// // import 'package:phone_verification/loggedInScreen.dart';

// // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final _formKey = GlobalKey<FormState>();
//   final _formKeyOTP = GlobalKey<FormState>();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   final TextEditingController numberController = TextEditingController();
//   final TextEditingController otpController = TextEditingController();

//   var isLoading = false;
//   var isResend = false;
//   var isLoginScreen = true;
//   var isOTPScreen = false;
//   var verificationCode = '';

//   //Form controllers
//   @override
//   void initState() {
//     if (_auth.currentUser != null) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//           builder: (BuildContext context) => NavigationScreen(
//             cameras: [],
//             name: 'Madhav Arora',
//             about: '👋🏻 Hey! there I am using WhatsApp India.',
//             avatar:
//                 'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
//             countryCode: '+91',
//             phoneno: '9999348444',
//           ),
//         ),
//         (route) => false,
//       );
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the Widget is disposed
//     numberController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isOTPScreen ? returnOTPScreen() : returnLoginScreen();
//   }

//   Widget returnLoginScreen() {
//     return Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: Text('Login Screen'),
//         ),
//         body: ListView(children: [
//           Column(
//             children: [
//               Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       Container(
//                           child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 10.0),
//                         child: TextFormField(
//                           enabled: !isLoading,
//                           controller: numberController,
//                           keyboardType: TextInputType.phone,
//                           decoration:
//                               InputDecoration(labelText: 'Phone Number'),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter phone number';
//                             }
//                           },
//                         ),
//                       )),
//                       Container(
//                           margin: EdgeInsets.only(top: 40, bottom: 5),
//                           child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: !isLoading
//                                   ? ElevatedButton(
//                                       onPressed: () async {
//                                         if (!isLoading) {
//                                           if (_formKey.currentState!
//                                               .validate()) {
//                                             displaySnackBar('Please wait...');
//                                             await login();
//                                           }
//                                         }
//                                       },
//                                       child: Container(
//                                           padding: const EdgeInsets.symmetric(
//                                             vertical: 15.0,
//                                             horizontal: 15.0,
//                                           ),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               Expanded(
//                                                   child: Text(
//                                                 "Sign In",
//                                                 textAlign: TextAlign.center,
//                                               )),
//                                             ],
//                                           )),
//                                     )
//                                   : CircularProgressIndicator(
//                                       backgroundColor:
//                                           Theme.of(context).primaryColor,
//                                     ))),
//                       Container(
//                           margin: EdgeInsets.only(top: 15, bottom: 5),
//                           alignment: AlignmentDirectional.center,
//                           child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 10.0),
//                                       child: Text(
//                                         "No Account ?",
//                                       )),
//                                   InkWell(
//                                     child: Text(
//                                       'Sign up',
//                                     ),
//                                     onTap: () => {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   LoginScreen()))
//                                     },
//                                   ),
//                                 ],
//                               )))
//                     ],
//                   ))
//             ],
//           )
//         ]));
//   }

//   Widget returnOTPScreen() {
//     return Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: Text('OTP Screen'),
//         ),
//         body: ListView(children: [
//           Form(
//             key: _formKeyOTP,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                     child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 10.0),
//                         child: Text(
//                             !isLoading
//                                 ? "Enter OTP from SMS"
//                                 : "Sending OTP code SMS",
//                             textAlign: TextAlign.center))),
//                 !isLoading
//                     ? Container(
//                         child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 10.0),
//                         child: TextFormField(
//                           enabled: !isLoading,
//                           controller: otpController,
//                           keyboardType: TextInputType.number,
//                           inputFormatters: <TextInputFormatter>[
//                             FilteringTextInputFormatter.digitsOnly
//                           ],
//                           initialValue: null,
//                           autofocus: true,
//                           decoration: InputDecoration(
//                               labelText: 'OTP',
//                               labelStyle: TextStyle(color: Colors.black)),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter OTP';
//                             }
//                           },
//                         ),
//                       ))
//                     : Container(),
//                 !isLoading
//                     ? Container(
//                         margin: EdgeInsets.only(top: 40, bottom: 5),
//                         child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 10.0),
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 if (_formKeyOTP.currentState!.validate()) {
//                                   // If the form is valid, we want to show a loading Snackbar
//                                   // If the form is valid, we want to do firebase signup...
//                                   setState(() {
//                                     isResend = false;
//                                     isLoading = true;
//                                   });
//                                   try {
//                                     await _auth
//                                         .signInWithCredential(
//                                             PhoneAuthProvider.credential(
//                                                 verificationId:
//                                                     verificationCode,
//                                                 smsCode: otpController.text
//                                                     .toString()))
//                                         .then((user) async => {
//                                               //sign in was success
//                                               if (user != null)
//                                                 {
//                                                   //store registration details in firestore database
//                                                   setState(() {
//                                                     isLoading = false;
//                                                     isResend = false;
//                                                   }),
//                                                   Navigator.pushAndRemoveUntil(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                       builder: (BuildContext
//                                                               context) =>
//                                                           NavigationScreen(
//                                                         cameras: [],
//                                                         name: 'Madhav Arora',
//                                                         about:
//                                                             '👋🏻 Hey! there I am using WhatsApp India.',
//                                                         avatar:
//                                                             'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
//                                                         countryCode: '+91',
//                                                         phoneno: '9999348444',
//                                                       ),
//                                                     ),
//                                                     (route) => false,
//                                                   )
//                                                 }
//                                             })
//                                         .catchError((error) => {
//                                               setState(() {
//                                                 isLoading = false;
//                                                 isResend = true;
//                                               }),
//                                             });
//                                     setState(() {
//                                       isLoading = true;
//                                     });
//                                   } catch (e) {
//                                     setState(() {
//                                       isLoading = false;
//                                     });
//                                   }
//                                 }
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 15.0,
//                                   horizontal: 15.0,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Expanded(
//                                       child: Text(
//                                         "Submit",
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )))
//                     : Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 CircularProgressIndicator(
//                                   backgroundColor:
//                                       Theme.of(context).primaryColor,
//                                 )
//                               ].where((c) => c != null).toList(),
//                             )
//                           ]),
//                 isResend
//                     ? Container(
//                         margin: EdgeInsets.only(top: 40, bottom: 5),
//                         child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 10.0),
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 setState(() {
//                                   isResend = false;
//                                   isLoading = true;
//                                 });
//                                 await login();
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 15.0,
//                                   horizontal: 15.0,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Expanded(
//                                       child: Text(
//                                         "Resend Code",
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )))
//                     : Column()
//               ],
//             ),
//           )
//         ]));
//   }

//   displaySnackBar(text) {
//     final snackBar = SnackBar(content: Text(text));
//     _scaffoldKey.currentState!.showSnackBar(snackBar);
//   }

//   Future login() async {
//     setState(() {
//       isLoading = true;
//     });

//     var phoneNumber = '+27 ' + numberController.text.trim();

//     //first we will check if a user with this cell number exists
//     var isValidUser = true;
//     var number = numberController.text.trim();

//     // await _firestore
//     //     .collection('users')
//     //     .where('cellnumber', isEqualTo: number)
//     //     .get()
//     //     .then((result) {
//     // if (result.docs.length > 0) {
//     // isValidUser = true;
//     // }
//     // }
//     // );

//     if (isValidUser) {
//       //ok, we have a valid user, now lets do otp verification
//       var verifyPhoneNumber = _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (phoneAuthCredential) {
//           //auto code complete (not manually)
//           _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
//                 if (user != null)
//                   {
//                     //redirect
//                     setState(() {
//                       isLoading = false;
//                       isOTPScreen = false;
//                     }),
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (BuildContext context) => NavigationScreen(
//                           cameras: [],
//                           name: 'Madhav Arora',
//                           about: '👋🏻 Hey! there I am using WhatsApp India.',
//                           avatar:
//                               'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
//                           countryCode: '+91',
//                           phoneno: '9999348444',
//                         ),
//                       ),
//                       (route) => false,
//                     )
//                   }
//               });
//         },
//         verificationFailed: (FirebaseAuthException error) {
//           displaySnackBar('Validation error, please try again later');
//           setState(() {
//             isLoading = false;
//           });
//         },
//         codeSent: (verificationId, [forceResendingToken]) {
//           setState(() {
//             isLoading = false;
//             verificationCode = verificationId;
//             isOTPScreen = true;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           setState(() {
//             isLoading = false;
//             verificationCode = verificationId;
//           });
//         },
//         timeout: Duration(seconds: 60),
//       );
//       await verifyPhoneNumber;
//     } else {
//       //non valid user
//       setState(() {
//         isLoading = false;
//       });
//       displaySnackBar('Number not found, please sign up first');
//     }
//   }
// }
