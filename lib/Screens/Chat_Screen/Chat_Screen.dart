// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_final_fields, sized_box_for_whitespace, file_names

import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Message_Model.dart';
import 'package:whatsapp/Screens/Camera_Screen/Camera_Screen.dart';
import 'package:whatsapp/Screens/Chats_Wallpaper_Screen/Chats_Wallpaper_Screen.dart';
import 'package:whatsapp/Screens/Media_Links_And_Docs/Media_Links_And_Docs.dart';
import 'package:whatsapp/Screens/Payment_Screen/Payment_Screen.dart';
import 'package:whatsapp/Screens/View_Photo/View_Photo.dart';
import 'package:whatsapp/Screens/View_Profile/View_Profile.dart';
import 'package:whatsapp/Screens/WhatsApp_Video_Calling_Screen/WhatsApp_Video_Calling_Screen.dart';
import 'package:whatsapp/Theme/Provider/Theme_Provider.dart';
import 'package:whatsapp/Widgets/OwnMessageCard.dart';
import 'package:whatsapp/Widgets/Reply_Card.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({
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
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final phoneNo = '7982880636';

  List<MessageModel> allMessages = [];

  // final own = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
  // ? primary
  // : Color(0xffdcf8c6);

  bool send = false;

  ImagePicker _picker = ImagePicker();
  XFile? file;

  _makingPhoneCall() async {
    final url = 'tel:' + phoneNo;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void sendMessage(
    String message,
    // int sourceId,
    // int targetId,
  ) {
    setMessage(
      "source",
      message,
    );
  }

  void setMessage(
    String type,
    String message,
    // int sourceId,
    // int targetId,
  ) {
    MessageModel messageModel = MessageModel(
      message: message,
      type: type,
      time: '2:30pm',
    );
    setState(() {
      setState(() {
        allMessages.add(messageModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final back = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? Color(0xFF101D24)
        : Color(0xFfE5DDD5);

    final reply =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Color(0xFF232D35)
            : white;

    final own = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? primary
        : Color(0xffdcf8c6);

    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? white
        : black;
    return Stack(
      children: [
        // Image.asset(
        //   "../assets/images/chat_Back.png",
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        Scaffold(
          backgroundColor: back,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.avatar,
                      ),
                      radius: 20,
                      backgroundColor: grey,
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => ViewProfile(
                        name: widget.name,
                        avatar: widget.avatar,
                        phoneno: widget.phoneno,
                        about: widget.about,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "last seen today at 12:05PM",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.videocam,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => WhatsAppVideoCallingScreen(
                          cameras: [],
                          avatar: widget.avatar,
                          name: widget.name,
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.call,
                  ),
                  onPressed: () {
                    _makingPhoneCall();
                  },
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: black,
                    iconTheme: IconThemeData(
                      color: white,
                    ),
                    textTheme: TextTheme().apply(),
                  ),
                  child: PopupMenuButton<int>(
                    onSelected: (item) => onSelected(
                      context,
                      item,
                      widget.name,
                      widget.avatar,
                      widget.phoneno,
                      widget.about,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: [
                            Text(
                              'View contact',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          children: [
                            Text(
                              'Media, links and docs',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Row(
                          children: [
                            Text(
                              'Search',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 3,
                        child: Row(
                          children: [
                            Text(
                              'Mute notifications',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 4,
                        child: Row(
                          children: [
                            Text(
                              'Wallpaper',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'More',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Icon(Icons.arrow_right)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: allMessages.length,
                      itemBuilder: (context, index) {
                        if (allMessages[index].type == "source") {
                          return OwnMessageCard(
                            color: own,
                            textColor: text,
                            message: allMessages[index].message,
                          );
                        } else {
                          return ReplyCard(
                            color: reply,
                            textColor: text,
                            message: allMessages[index].message,
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: EdgeInsets.only(
                                    left: 2,
                                    right: 2,
                                    bottom: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 6,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle: TextStyle(color: grey),
                                      prefixIcon: IconButton(
                                        icon: Icon(
                                          show
                                              ? Icons.keyboard
                                              : Icons.emoji_emotions_outlined,
                                        ),
                                        onPressed: () {
                                          if (!show) {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                          }
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                backgroundColor: transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    bottomSheet(),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.monetization_on),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (builder) =>
                                                      PaymentScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.camera_alt,
                                              color: one,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (builder) =>
                                                      CameraScreen(
                                                    cameras: [],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: one,
                                  child: IconButton(
                                    icon: Icon(
                                      sendButton ? Icons.send : Icons.mic,
                                      color: white,
                                    ),
                                    onPressed: () {
                                      if (sendButton) {
                                        send = true;
                                        AssetsAudioPlayer.newPlayer().open(
                                          Audio(
                                            "../assets/sounds/message_received.mp3",
                                          ),
                                          autoStart: true,
                                          showNotification: true,
                                        );
                                        _scrollController.animateTo(
                                          _scrollController
                                              .position.maxScrollExtent,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeOut,
                                        );
                                        sendMessage(
                                          _controller.text,
                                          // 2,
                                          // 2,
                                        );
                                        _controller.clear();
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 385,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.insert_drive_file,
                    deepPurple,
                    "Document",
                    () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.camera_alt,
                    pink.shade500,
                    "Camera",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => CameraScreen(
                            cameras: [],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.insert_photo,
                    purple,
                    "Gallery",
                    () async {
                      file = await _picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => CameraViewPage(
                            path: file!.path,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.headset,
                    orange.shade900,
                    "Audio",
                    () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.monetization_on,
                    one,
                    "Payment",
                    () {},
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.location_pin,
                    green.shade700,
                    "Location",
                    () {},
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.person,
                    blue.shade800,
                    "Contact",
                    () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(
    IconData icons,
    Color color,
    String text,
    onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              size: 29,
              color: white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
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
          _controller.text = _controller.text + emoji.emoji;
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

void onSelected(
  BuildContext context,
  int item,
  name,
  avatar,
  phoneno,
  about,
) {
  switch (item) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ViewProfile(
            name: name,
            avatar: avatar,
            phoneno: phoneno,
            about: about,
          ),
        ),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MediaLinksAndDocs(),
        ),
      );
      break;
    case 2:
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("Your contact list has been updated."),
      //   ),
      // );
      break;
    case 3:
      showDialog(
        context: context,
        builder: (BuildContext context) => MuteNotifications(),
      );
      break;
    case 4:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ChatsWallpaperScreen(),
        ),
      );
      break;
    case 5:
      break;
  }
}

void onSelected1(
  BuildContext context,
  int item,
  name,
  avatar,
  phoneno,
  about,
) {
  switch (item) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ViewProfile(
            name: name,
            avatar: avatar,
            phoneno: phoneno,
            about: about,
          ),
        ),
      );
      break;
    case 1:
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => MediaLinksAndDocs(),
      //   ),
      // );
      break;
    case 2:
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("Your contact list has been updated."),
      //   ),
      // );
      break;
    case 3:
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => ContactsHelpScreen(),
      //   ),
      // );
      break;
    case 4:
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => ContactsHelpScreen(),
      //   ),
      // );
      break;
    case 5:
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => ContactsHelpScreen(),
      //   ),
      // );
      break;
  }
}

class MuteNotifications extends StatefulWidget {
  MuteNotifications({Key? key}) : super(key: key);

  @override
  _MuteNotificationsState createState() => _MuteNotificationsState();
}

class _MuteNotificationsState extends State<MuteNotifications> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Mute notifications for...",
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle_outlined,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('8 hours'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.circle_outlined,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('1 week'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.stop_circle_outlined,
                  color: one,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Always'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: Divider(
                thickness: 1,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: one,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Show notifications'),
              ],
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
                    'CANCEL',
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
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: one,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
