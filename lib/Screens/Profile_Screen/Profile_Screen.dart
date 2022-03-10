// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/About_Screen/About_Screen.dart';
import 'package:whatsapp/Screens/Change_Number_Screen_One/Change_Number_Screen_One.dart';
import 'package:whatsapp/Screens/View_Profile_Photo/View_Profile_Photo.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key? key,
    required this.avatar,
    required this.name,
    required this.phoneno,
    required this.about,
  }) : super(key: key);

  final String name;
  final String avatar;
  final String phoneno;
  final String about;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    File? _imageFile;
    String uploadedPath = "";
    late XFile _image;
    var name = widget.name;
    var about = widget.about;
    ImagePicker imagePicker = ImagePicker();
    void uploadImage() {
      // String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
      // final Reference storageReference =
      //     FirebaseStorage.instance.ref().child('Images').child(imageFileName);
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

    imagePickerMethod(ImageSource source) async {
      var pic = await imagePicker.pickImage(source: source);
      if (pic != null) {
        setState(() {
          _image = XFile(pic.path);
        });
      }
      uploadImage();
    }

    selectImage() async {
      await showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
          builder: (context) => Column(
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
          ),
          onClosing: () {},
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ViewProfilePhoto(
                              name: widget.name,
                              avatar: widget.avatar,
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 80,
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor: grey,
                        backgroundImage: NetworkImage(
                          widget.avatar,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            // showModalBottomSheet(
                            //   backgroundColor: transparent,
                            //   context: context,
                            //   builder: (builder) => bottomSheet(context),
                            // );
                            selectImage();
                          },
                          child: Container(
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: one,
                              borderRadius: BorderRadius.all(
                                Radius.circular(35),
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: transparent,
                  context: context,
                  builder: (builder) => bottomSheet1(context),
                );
              },
              leading: Icon(
                Icons.person,
                color: grey,
                size: 25,
              ),
              title: Text(
                "Name",
                style: TextStyle(
                  color: grey,
                  fontSize: 17,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'This is not your username or pin. This name will be visible to your WhatsApp contacts.',
                    style: TextStyle(
                      color: grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
              trailing: Icon(
                Icons.edit,
                color: one,
                size: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => AboutScreen(),
                  ),
                );
              },
              leading: Icon(
                Icons.info_outline,
                color: grey,
                size: 25,
              ),
              title: Text(
                "About",
                style: TextStyle(
                  color: grey,
                  fontSize: 17,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    about,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
              trailing: Icon(
                Icons.edit,
                color: one,
                size: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ChangeNumberScreenOne(),
                  ),
                );
              },
              leading: Icon(
                Icons.call,
                color: grey,
                size: 25,
              ),
              title: Text(
                "Phone",
                style: TextStyle(
                  color: grey,
                  fontSize: 17,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "+91 ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.phoneno,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet1(context) {
    TextEditingController _nameController = TextEditingController();
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Enter your name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: TextField(
                  controller: _nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: widget.name,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.emoji_emotions_outlined,
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(30),
            ),
            child: CircleAvatar(
              radius: 30,
              child: Icon(
                icons,
                size: 29,
                color: one,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
