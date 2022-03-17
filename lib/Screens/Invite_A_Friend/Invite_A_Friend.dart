// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:get/get.dart';

class InviteAFriend extends StatefulWidget {
  InviteAFriend({Key? key}) : super(key: key);

  @override
  _InviteAFriendState createState() => _InviteAFriendState();
}

class _InviteAFriendState extends State<InviteAFriend> {
  final TextEditingController _hi = TextEditingController();

  Widget appBarTitle = Text('inviteAFriend'.tr);

  Icon actionIcon = Icon(
    Icons.search,
    size: 26,
  );

  var query;
  late bool _IsSearching;
  String _searchText = "";

  _InviteAFriendState() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      color: white,
                    ),
                    controller: _hi,
                    decoration: InputDecoration(
                      fillColor: one,
                      hoverColor: one,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 26,
                        color: white,
                      ),
                      hintText: "search".tr,
                      hintStyle: TextStyle(
                        color: white,
                      ),
                    ),
                  );
                } else {
                  _handleSearchEnd();
                  actionIcon = Icon(
                    Icons.search,
                    size: 26,
                  );
                  appBarTitle = Text('inviteAFriend'.tr);
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 5.0,
            ),
            child: ListTile(
              onTap: () {
                Share.share(
                  "shareText".tr + ' ' + "https://whatsappIndia.com/dl/",
                );
              },
              leading: CircleAvatar(
                backgroundColor: one,
                radius: 23,
                child: Icon(
                  Icons.share,
                  color: white,
                ),
              ),
              title: Text(
                'shareLink'.tr,
              ),
            ),
          ),
        ],
      ),
    );
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
