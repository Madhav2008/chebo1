// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/About_Model.dart';
import 'package:whatsapp/Screens/About_Screen/About_Screen.dart';
import 'package:whatsapp/Screens/Change_Number_Screen_One/Change_Number_Screen_One.dart';
import 'package:whatsapp/Screens/View_Profile_Photo/View_Profile_Photo.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key? key,
    required this.avatar,
    required this.name,
    required this.phoneno,
    required this.countryCode,
    required this.about,
  }) : super(key: key);

  final String name;
  final String avatar;
  final String phoneno;
  final String countryCode;
  final String about;

  @override
  _ProfileScreenState createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  String aboutss = '👋🏻 Hey! there I am using WhatsApp India.';
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    File? _imageFile;
    String uploadedPath = "";
    late XFile _image;
    bool _isLoading = false;
    ImagePicker imagePicker = ImagePicker();

    void uploadImage() {
      String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('Images').child(imageFileName);
      final UploadTask uploadTask = storageReference.putFile(File(_image.path));
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isLoading = true;
        });
      });
      uploadTask.then((TaskSnapshot taskSnapshot) async {
        uploadedPath = await uploadTask.snapshot.ref.getDownloadURL();
        print(uploadedPath);

        setState(() {
          _isLoading = false;
        });
      }).catchError((error) {});
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
                  }),
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
          onClosing: () {
            uploadImage();
          },
        ),
      );
    }

    void saveData() {
      // RecipeDatabase.addRecipe(
      //   userId: userId,
      //   title: titleController.text,
      //   about_recipe: aboutController.text,
      //   cooking_method: cookingMethodController.text,
      //   ingredient: ingredientController.text,
      //   time_to_cook: timeToCookController.text,
      //   category: _currentItemSelected,
      //   image: uploadedPath,
      // );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr),
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
                            builder: (BuildContext context) {
                              return ViewProfilePhoto(
                                name: widget.name,
                                avatar: widget.avatar,
                              );
                            },
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 80,
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor: grey,
                        backgroundImage: NetworkImage(
                          widget.avatar.isNotEmpty
                              ? widget.avatar
                              : 'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4',
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
                            //   builder: (builder) {
                            //     return bottomSheet(context);
                            //   },
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
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //   child: Column(
            //     children: [
            //       ListView(
            //         shrinkWrap: true,
            //         children: <Widget>[
            //           _imageFile != null
            //               ? Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: <Widget>[
            //                     ClipRRect(
            //                       borderRadius:
            //                           BorderRadius.all(Radius.circular(10)),
            //                       child: Container(
            //                         width:
            //                             MediaQuery.of(context).size.width - 20,
            //                         child: Image.file(
            //                           _imageFile,
            //                           fit: BoxFit.fitWidth,
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 )
            //               : GestureDetector(
            //                   onTap: () {
            //                     selectImage();
            //                   },
            //                   child: Card(
            //                     elevation: 2,
            //                     child: Container(
            //                       alignment: Alignment.center,
            //                       width: MediaQuery.of(context).size.width,
            //                       height:
            //                           MediaQuery.of(context).size.height * .3,
            //                       child: _isLoading == false
            //                           ? Expanded(
            //                               child: uploadedPath == ""
            //                                   ? Column(
            //                                       mainAxisAlignment:
            //                                           MainAxisAlignment.center,
            //                                       children: [
            //                                         Icon(
            //                                           Icons
            //                                               .cloud_upload_outlined,
            //                                           color: Colors.redAccent,
            //                                           size: 100,
            //                                         ),
            //                                         Padding(
            //                                           padding:
            //                                               EdgeInsets.symmetric(
            //                                                   vertical: 5),
            //                                           child: Text(
            //                                             "Upload Image",
            //                                             style: TextStyle(
            //                                                 fontSize: 22),
            //                                           ),
            //                                         ),
            //                                         Padding(
            //                                           padding:
            //                                               EdgeInsets.symmetric(
            //                                                   vertical: 5),
            //                                           child: Text(
            //                                               "click here for upload image"),
            //                                         )
            //                                       ],
            //                                     )
            //                                   : Image(
            //                                       image: NetworkImage(
            //                                           uploadedPath)),
            //                             )
            //                           : CircularProgressIndicator(
            //                               color: Colors.red,
            //                             ),
            //                       // child: Image.asset(
            //                       //   'assets/images/upload.png',
            //                       //   fit: BoxFit.cover,
            //                       // ),
            //                     ),
            //                   ),
            //                 ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            ListTile(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: transparent,
                  context: context,
                  builder: (builder) {
                    return Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
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
                                  'enterYourName'.tr,
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
                                  onPressed: () {
                                    emojiSelect();
                                  },
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
                                      'cancel'.tr,
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
                                      'save'.tr,
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
                  },
                );
              },
              leading: Icon(
                Icons.person,
                color: grey,
                size: 25,
              ),
              title: Text(
                "name".tr,
                style: TextStyle(
                  color: grey,
                  fontSize: 17,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'nameDown'.tr,
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
                    builder: (BuildContext context) {
                      return AboutScreen(
                        setAboutData: setAboutData,
                      );
                    },
                  ),
                );
              },
              leading: Icon(
                Icons.info_outline,
                color: grey,
                size: 25,
              ),
              title: Text(
                "about".tr,
                style: TextStyle(
                  color: grey,
                  fontSize: 17,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    aboutss,
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
                    builder: (BuildContext context) {
                      return ChangeNumberScreenOne();
                    },
                  ),
                );
              },
              leading: Icon(
                Icons.call,
                color: grey,
                size: 25,
              ),
              title: Text(
                "phone".tr,
                style: TextStyle(
                  color: grey,
                  fontSize: 17,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.countryCode + ' ' + widget.phoneno,
                    style: TextStyle(
                      fontSize: 18,
                    ),
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

  void setAboutData(AboutModel aboutModel) {
    setState(() {
      aboutss = aboutModel.logo + ' ' + aboutModel.about;
    });
    Navigator.pop(context);
  }

  Widget emojiSelect() {
    return
        //  EmojiPicker(
        //     rows: 4,
        //     columns: 7,
        //     onEmojiSelected: (emoji, category) {
        //       print(emoji);
        //       setState(() {
        //         _controller.text = _controller.text + emoji.emoji;
        //       });
        //     });
        EmojiPicker(
      onEmojiSelected: (category, emoji) {
        print(emoji);
        setState(() {
          _nameController.text = _nameController.text + emoji.emoji;
        });
      },
      onBackspacePressed: () {
        // Backspace-Button tapped logic
        // Remove this line to also remove the button in the UI
      },
      config: Config(
        columns: 7,
        emojiSizeMax: 32,
        // (Platform.isIOS
        // ? 1.30
        // : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
        verticalSpacing: 0,
        horizontalSpacing: 0,
        initCategory: Category.RECENT,
        bgColor: Color(0xFFF2F2F2),
        indicatorColor: Colors.blue,
        iconColor: Colors.grey,
        iconColorSelected: Colors.blue,
        progressIndicatorColor: Colors.blue,
        backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,
        showRecentsTab: true,
        recentsLimit: 28,
        noRecentsText: "No Recents",
        noRecentsStyle: TextStyle(
          fontSize: 20,
          color: Colors.black26,
        ),
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: const CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
      ),
    );
  }
}
