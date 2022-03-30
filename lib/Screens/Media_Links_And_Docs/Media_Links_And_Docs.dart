// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class MediaLinksAndDocs extends StatefulWidget {
  MediaLinksAndDocs({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

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
                title: Text(widget.name),
                floating: true,
                pinned: true,
                snap: true,
                bottom: TabBar(
                  indicatorColor: one,
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
              Center(
                child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            padding: EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: <String>[
              'assets/1.jpg',
              'assets/2.jpg',
              'assets/3.JPG',
              'assets/4.JPG',
              'assets/5.jpg',
              'assets/6.jpg',
              'assets/7.jpg',
              'assets/8.jpg',
              'assets/9.jpg',
              'assets/10.jpg'
            ].map((String url) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0)
                    ),
                child: GridTile(
                  child: Image.asset(url, fit: BoxFit.cover,),
                ),
                
              );
            }).toList()),
              ),
              Center(
                child: Text('Docs'),
              ),
              Center(
                child: Text('Links'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
