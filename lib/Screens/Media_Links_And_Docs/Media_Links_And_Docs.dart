// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Screens/Chats_Screen/Chats_Screen.dart';

class MediaLinksAndDocs extends StatefulWidget {
  MediaLinksAndDocs({Key? key}) : super(key: key);

  @override
  _MediaLinksAndDocsState createState() => _MediaLinksAndDocsState();
}

class _MediaLinksAndDocsState extends State<MediaLinksAndDocs>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text("Madhav Arora"),
                floating: true,
                pinned: true,
                snap: true,
                bottom: TabBar(
                  tabs: <Tab>[
                    Tab(text: "MEDIA"),
                    Tab(text: "DOCS"),
                    Tab(text: "LINKS"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              ChatsScreen(),
              ChatsScreen(),
              ChatsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
