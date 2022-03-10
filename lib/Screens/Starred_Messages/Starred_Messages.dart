// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class StarredMessages extends StatefulWidget {
  StarredMessages({Key? key}) : super(key: key);

  @override
  _StarredMessagesState createState() => _StarredMessagesState();
}

class _StarredMessagesState extends State<StarredMessages> {
  final TextEditingController _hi = TextEditingController();

  Widget appBarTitle = Text('Starred messages');

  Icon actionIcon = Icon(
    Icons.search,
    size: 26,
  );

  var query;
  late bool _IsSearching;
  String _searchText = "";

  _StarredMessagesState() {
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
                      hintText: "Search",
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
                  appBarTitle = Text('Starred messages');
                }
              });
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
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        'Unstar all',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
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
