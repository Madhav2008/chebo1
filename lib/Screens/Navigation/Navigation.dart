// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_print

import 'package:camera/camera.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/No_Connection/No_Connection.dart';
import 'package:whatsapp/Screens/Calls_Screen/Calls_Screen.dart';
import 'package:whatsapp/Screens/Camera_Screen/Camera_Screen.dart';
import 'package:whatsapp/Screens/Chats_Screen/Chats_Screen.dart';
import 'package:whatsapp/Screens/Create_Group/Create_Group.dart';
import 'package:whatsapp/Screens/Linked_Devices/Linked_Devices.dart';
import 'package:whatsapp/Screens/New_Broadcast/New_Broadcast.dart';
import 'package:whatsapp/Screens/Payment_Screen/Payment_Screen.dart';
import 'package:whatsapp/Screens/Select_Contact/Select_Contact.dart';
import 'package:whatsapp/Screens/Settings_Screen/Settings_Screen.dart';
import 'package:whatsapp/Screens/Starred_Messages/Starred_Messages.dart';
import 'package:whatsapp/Screens/Status_Screen/Status_Screen.dart';

class NavigationScreen extends StatefulWidget {
  late List<CameraDescription> cameras;
  NavigationScreen({
    Key? key,
    required this.cameras,
    required this.name,
    required this.avatar,
    required this.phoneno,
    required this.about,
  }) : super(key: key);

  final String name;
  final String about;
  final String avatar;
  final String phoneno;

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool showFab = true;

  final TextEditingController _hi = TextEditingController();

  Widget appBarTitle = Text(
    'WhatsApp',
    style: TextStyle(
      fontSize: 20,
      letterSpacing: 2,
    ),
  );

  Icon actionIcon = Icon(
    Icons.search,
    size: 26,
  );

  var query;
  late bool _IsSearching;
  String _searchText = "";

  _NavigationScreenState() {
    _hi.addListener(() {
      _hi.value = query;
      if (_hi.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _hi.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (BuildContext context,
              AsyncSnapshot<ConnectivityResult> snapshot) {
            if (snapshot != null &&
                snapshot.hasData &&
                snapshot.data != ConnectivityResult.none) {
              //  SecurityScreen(),
              return Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        title: appBarTitle,
                        actions: [
                          IconButton(
                            icon: actionIcon,
                            onPressed: () {
                              setState(() {
                                if (actionIcon.icon == Icons.search) {
                                  _handleSearchStart();
                                  actionIcon = Icon(Icons.close);
                                  appBarTitle = TextField(
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    controller: _hi,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 26,
                                        color: white,
                                      ),
                                      hintText: "search".tr,
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                } else {
                                  _handleSearchEnd();
                                  actionIcon = Icon(
                                    Icons.search,
                                    size: 26,
                                  );
                                  appBarTitle = Text(
                                    'WhatsApp',
                                    style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 2,
                                    ),
                                  );
                                }
                              });
                            },
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.black,
                              iconTheme: IconThemeData(
                                color: white,
                              ),
                              textTheme: TextTheme().apply(),
                            ),
                            child: PopupMenuButton<int>(
                              onSelected: (item) => onSelected(context, item),
                              itemBuilder: (context) => [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Row(
                                    children: [
                                      Text(
                                        'group'.tr,
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
                                        'broadcast'.tr,
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
                                        'devices'.tr,
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
                                        'starred'.tr,
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
                                        'payments'.tr,
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
                                    children: [
                                      Text(
                                        'settings'.tr,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        floating: true,
                        pinned: true,
                        snap: true,
                        bottom: TabBar(
                          controller: _tabController,
                          indicatorColor: white,
                          indicatorWeight: 3,
                          labelColor: white,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelColor: lightText,
                          tabs: [
                            Tab(
                              icon: Icon(Icons.camera_alt),
                            ),
                            Tab(
                              text: 'chatsC'.tr,
                            ),
                            Tab(
                              text: 'statusC'.tr,
                            ),
                            Tab(
                              text: 'callsC'.tr,
                            ),
                          ],
                        ),
                        elevation: 20,
                        titleSpacing: 20,
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      CameraScreen(
                        cameras: [],
                      ),
                      ChatsScreen(),
                      StatusScreen(),
                      CallsScreen(),
                    ],
                  ),
                ),
                floatingActionButton: showFab
                    ? FloatingActionButton(
                        backgroundColor: one,
                        child: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => SelectContact(),
                          ),
                        ),
                      )
                    : null,
              );
            } else {
              return NoConnection();
            }
          },
        ),
      );

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CreateGroup(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewBroadcast(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LinkedDevices(
              name: widget.name,
              about: widget.about,
              phoneno: widget.phoneno,
              avatar: widget.avatar,
            ),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StarredMessages(),
          ),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PaymentScreen(),
          ),
        );
        break;
      case 5:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SettingsScreen(
              name: widget.name,
              about: widget.about,
              avatar: widget.avatar,
              phoneno: widget.phoneno,
            ),
          ),
        );
        break;
    }
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      _IsSearching = false;
    });
  }
}
