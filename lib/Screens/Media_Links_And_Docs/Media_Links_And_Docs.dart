// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/View_Chat_Photo/View_Chat_Photo.dart';

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
              CustomScrollView(
                slivers: [
                  SliverGrid.count(
                    crossAxisCount: 3,
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int _) {
                          return Container(
                            padding: EdgeInsets.only(right: 5.0),
                            width: 70.0,
                            height: 20.0 - 10.0 * 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => ViewChatPhoto(
                                      path:
                                          'https://source.unsplash.com/720x600/',
                                      senderName: widget.name,
                                      time: DateTime.now().toString().substring(
                                            0,
                                            16,
                                          ),
                                    ),
                                  ),
                                );
                              },
                              child: Image(
                                image: NetworkImage(
                                  'https://source.unsplash.com/720x600/',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                        color: Colors.lightBlueAccent,
                        child: ListTile(
                          leading: Text('Tile Number:'),
                          trailing: Text('$index'),
                        ),
                      ),
                      childCount: 15,
                    ),
                  ),
                ],
              ),
              // Center(
              //   child: ListView.builder(
              //     padding: EdgeInsets.symmetric(
              //       vertical: 10.0,
              //     ),
              //     itemBuilder: (BuildContext context, int _) {
              //       return Container(
              //         padding: EdgeInsets.only(right: 5.0),
              //         width: 70.0,
              //         // height: 90.0 - 10.0 * 2,
              //         child: GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (builder) => ViewChatPhoto(
              //                   path: 'https://source.unsplash.com/720x600/',
              //                   senderName: widget.name,
              //                   time: DateTime.now().toString().substring(
              //                         0,
              //                         16,
              //                       ),
              //                 ),
              //               ),
              //             );
              //           },
              //           child: Image(
              //             image: NetworkImage(
              //               'https://source.unsplash.com/720x600/',
              //             ),
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
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
