// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Chat_Model.dart';
import 'package:whatsapp/Screens/Navigation/Navigation.dart';

class SelectAccountScreen extends StatefulWidget {
  SelectAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectAccountScreen> createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {
  bool isLoading = false;
  bool isSignedIn = false;


  @override
  Widget build(BuildContext context) {
    ChatModel sourceChat;
    return Scaffold(
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (
          context,
          index,
        ) {
          return InkWell(
            onTap: () {
              sourceChat = dummyData.removeAt(index);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (builder) => NavigationScreen(
                    cameras: [],
                    name: dummyData[index].name,
                    avatar: dummyData[index].avatarUrl,
                    phoneno: dummyData[index].phoneno,
                    countryCode: '+91',
                    about: dummyData[index].about,
                    sourceChat: sourceChat,
                    chatModels: dummyData,
                  ),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: white,
                  size: 30,
                ),
                backgroundColor: one,
              ),
              title: Text(dummyData[index].name),
            ),
          );
        },
      ),
    );
  }
}

// // ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:whatsapp/Widgets/Circular_Progress.dart';
// // import 'package:whatsapp/Models/Chat_Model.dart';

// class SelectAccountScreen extends StatefulWidget {
//   SelectAccountScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<SelectAccountScreen> createState() => _SelectAccountScreenState();
// }

// class _SelectAccountScreenState extends State<SelectAccountScreen> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
//     'email',
//   ]);

//   GoogleSignInAccount? _currentUser;

//   bool isLoading = false;
//   bool isSignedIn = false;

//   @override
//   void initState() {
//     _googleSignIn.onCurrentUserChanged.listen((account) {
//       _currentUser = account;
//     });
//     _googleSignIn.signIn();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ChatModel sourceChat;
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: _buildWidget(),
//       ),
//       // ListView.builder(
//       //   itemCount: dummyData.length,
//       //   itemBuilder: (
//       //     context,
//       //     index,
//       //   ) {
//       //     return InkWell(
//       //       onTap: () {
//       //         sourceChat = dummyData.removeAt(index);
//       //         Navigator.pushReplacement(
//       //           context,
//       //           MaterialPageRoute(
//       //             builder: (builder) => NavigationScreen(
//       //               cameras: [],
//       //               name: dummyData[index].name,
//       //               avatar: dummyData[index].avatarUrl,
//       //               phoneno: dummyData[index].phoneno,
//       //               countryCode: '+91',
//       //               about: dummyData[index].about,
//       //               sourceChat: sourceChat,
//       //               chatModels: dummyData,
//       //             ),
//       //           ),
//       //         );
//       //       },
//       //       child: ListTile(
//       //         leading: CircleAvatar(
//       //           child: Icon(
//       //             Icons.person,
//       //             color: white,
//       //             size: 30,
//       //           ),
//       //           backgroundColor: one,
//       //         ),
//       //         title: Text(dummyData[index].name),
//       //       ),
//       //     );
//       //   },
//       // ),
//     );
//   }

//   _buildWidget() {
//     GoogleSignInAccount? user = _currentUser;
//     if (user != null) {
//       return Padding(
//         padding: EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             ListTile(
//               leading: GoogleUserCircleAvatar(
//                 identity: user,
//               ),
//               title: Text(
//                 user.displayName ?? '',
//               ),
//               subtitle: Text(
//                 user.email,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Signed In Successfully',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//               onTap: signOut,
//               child: Container(
//                 width: 270,
//                 height: 65,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                       '../assets/images/google_signin_button.png',
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     } else {
//       return Padding(
//         padding: EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'You are not Signed In',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//               onTap: signIn,
//               child: Container(
//                 width: 270,
//                 height: 65,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                       '../assets/images/google_signin_button.png',
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   void signOut() {
//     _googleSignIn.disconnect();
//   }

//   signIn() async {
//     try {
//       _googleSignIn.signIn();
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (builder) => AlertDialog(
//           title: Text('Error'),
//           content: Text(
//             e.toString(),
//           ),
//         ),
//       );
//       print(e);
//     }
//   }

//   // Future<Null> controlSignIn() async {
//   // //   setState(() {
//   // //     isLoading = true;
//   // //   });
//   // //
//   // //   GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//   // //   GoogleSignInAuthentication googleAuthentication =
//   // //       await googleUser!.authentication;
//   // //
//   // //   final AuthCredential credential = GoogleAuthProvider.credential(
//   // //     idToken: googleAuthentication.idToken,
//   // //     accessToken: googleAuthentication.accessToken,
//   // //   );
//   // //
//   // //   User firebaseUser =
//   // //       await (firebaseAuth.signInWithCredential(credential)).user;
//   // //
//   // //   if(firebaseUser != null){
//   // //     // final QuerySnapshot resultQuery = await Firestore
//   // //   }
//   // //   else{
//   // //     print('failed');
//   // //     showDialog(context: context, builder: (builder)=>AlertDialog(
//   // //       title: Text('Login Failed'),
//   // //       content: Text('Try Again, Sign in failed!'),
//   // //     ),);
//   // //     setState(() {
//   // //       isLoading = false;
//   // //     });
//   // //   }
//   // }
// }
