// ignore_for_file: prefer_const_constructors_in_immutables, file_names

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Auth/Auth_Services.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/New/signin.dart';
import 'package:whatsapp/Screens/Payment_Screen/Payment_Screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  File? _imageFile;
  String uploadedPath = "";
  late XFile _image;
  ImagePicker imagePicker = ImagePicker();
  bool _isLoading = false;

  void saveUser(uid) {
    // UserDatabase.addUser(
    //     userId: uid,
    //     userName: nameController.text,
    //     about: aboutController.text,
    //     userEmail: emailController.text,
    //     contact: contactController.text,
    //     img: uploadedPath
    // );
  }

  selectImage() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                  imagePickerMethod(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.filter),
                title: Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop();
                  imagePickerMethod(ImageSource.gallery);
                },
              ),
            ],
          );
        },
        onClosing: () {},
      ),
    );
  }

  imagePickerMethod(ImageSource source) async {
    var pic = await imagePicker.pickImage(source: source);
    if (pic != null) {
      // setState(() {
      //   _image = XFile(pic.path);
      // });
    }
    uploadImage(); // image upload function
  }

  void uploadImage() {
    // String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    // final Reference storageReference =
    // FirebaseStorage.instance.ref().child('Images').child(imageFileName);
    // final UploadTask uploadTask = storageReference.putFile(File(_image.path));
    // uploadTask.snapshotEvents.listen((event) {
    //   setState(() {
    //     _isLoading = true;
    //   });
    // });
    // uploadTask.then((TaskSnapshot taskSnapshot) async {
    //   uploadedPath = await uploadTask.snapshot.ref.getDownloadURL();
    //   print(uploadedPath);

    //   setState(() {
    //     _isLoading = false;
    //   });
    // }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('../assets/images/chat_back.png'),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color(0xFF101D24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "../assets/images/WhatsAppIndiaLogo.png",
                  width: 100,
                  height: 100,
                ),
                Text(
                  'WhatsApp India',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //   child: Column(
                //     children: [
                //       ListView(
                //         shrinkWrap: true,
                //         children: <Widget>[
                //           _imageFile != null
                //               ? Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: <Widget>[
                //               ClipRRect(
                //                 borderRadius:
                //                 BorderRadius.all(Radius.circular(10)),
                //                 child: Container(
                //                   width: MediaQuery.of(context).size.width -
                //                       20,
                //                   child: Image.file(
                //                     _imageFile!,
                //                     fit: BoxFit.fitWidth,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           )
                //               : GestureDetector(
                //             onTap: () {
                //               selectImage();
                //             },
                //             child: Card(
                //               elevation: 2,
                //               child: Container(
                //                 alignment: Alignment.center,
                //                 width: MediaQuery.of(context).size.width,
                //                 height:
                //                 MediaQuery.of(context).size.height * .3,
                //                 child: _isLoading == false
                //                     ? Expanded(
                //                   child: uploadedPath == ""
                //                       ? Column(
                //                     mainAxisAlignment:
                //                     MainAxisAlignment
                //                         .center,
                //                     children: [
                //                       Icon(
                //                         Icons
                //                             .cloud_upload_outlined,
                //                         color: one,
                //                         size: 100,
                //                       ),
                //                       Padding(
                //                         padding: EdgeInsets
                //                             .symmetric(
                //                             vertical: 5),
                //                         child: Text(
                //                           "Upload Image",
                //                           style: TextStyle(
                //                               fontSize: 22),
                //                         ),
                //                       ),
                //                       Padding(
                //                         padding: EdgeInsets
                //                             .symmetric(
                //                             vertical: 5),
                //                         child: Text(
                //                             "click here for upload image"),
                //                       )
                //                     ],
                //                   )
                //                       : Image(
                //                       image: NetworkImage(
                //                           uploadedPath)),
                //                 )
                //                     : CircularProgressIndicator(
                //                   color: Colors.red,
                //                 ),
                //                 // child: Image.asset(
                //                 //   'assets/images/upload.png',
                //                 //   fit: BoxFit.cover,
                //                 // ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: one, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: one, width: 0.0),
                      ),
                      prefixIcon: Icon(
                        Icons.supervised_user_circle_outlined,
                        color: Colors.white,
                      ),
                      hintText: 'Name',
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
                    controller: aboutController,
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
                        Icons.assignment_outlined,
                        color: Colors.white,
                      ),
                      hintText: 'About',
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
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: one, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: one, width: 0.0),
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
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: contactController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: one, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: one, width: 0.0),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      hintText: 'Contact',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      await Provider.of<AuthService>(context)
                          .createUserWithEmailAndPassword(
                              emailController.text, passwordController.text)
                          .then((value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen()));
                        final userId = FirebaseAuth.instance.currentUser!.uid;
                        saveUser(userId);
                        // Fluttertoast.showToast(
                        //     msg: "User Registered Successfully!!",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.BOTTOM);
                      }).catchError((error) {
                        showDialog(
                            context: context,
                            builder: (con) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(error.toString()),
                              );
                            });
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      child: RaisedButton(
                        color: one,
                        onPressed: () async {
                          await Provider.of<AuthService>(context)
                              .createUserWithEmailAndPassword(
                                  emailController.text, passwordController.text)
                              .then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreen()));
                            final userId =
                                FirebaseAuth.instance.currentUser!.uid;
                            saveUser(userId);
                            // Fluttertoast.showToast(
                            //     msg: "User Registered Successfully!!",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM);
                          }).catchError((error) {
                            showDialog(
                                context: context,
                                builder: (con) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content: Text(error.toString()),
                                  );
                                });
                          });
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Center(
                //   child: GestureDetector(
                //     onTap: () async {
                //       await Provider.of<AuthService>(context)
                //           .createUserWithEmailAndPassword(
                //               emailController.text, passwordController.text)
                //           .then((value) {
                //         Navigator.pushReplacement(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => PaymentScreen()));
                //         final userId = FirebaseAuth.instance.currentUser!.uid;
                //         saveUser(userId);
                //         // Fluttertoast.showToast(
                //         //     msg: "User Registered Successfully!!",
                //         //     toastLength: Toast.LENGTH_SHORT,
                //         //     gravity: ToastGravity.BOTTOM);
                //       }).catchError((error) {
                //         showDialog(
                //             context: context,
                //             builder: (con) {
                //               return AlertDialog(
                //                 title: Text("Error"),
                //                 content: Text(error.toString()),
                //               );
                //             });
                //       });
                //     },
                //     child: Container(
                //       width: MediaQuery.of(context).size.width * 0.58,
                //       height: 50,
                //       child: Text('Register'),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
