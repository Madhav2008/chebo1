// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Chat_Model.dart';

class ExportChatScreen extends StatefulWidget {
  ExportChatScreen({Key? key}) : super(key: key);

  @override
  _ExportChatScreenState createState() => _ExportChatScreenState();
}

class _ExportChatScreenState extends State<ExportChatScreen> {
  final TextEditingController _hi = TextEditingController();
  Widget appBarTitle = Text(
    'Choose chat',
  );
  Icon actionIcon = Icon(
    Icons.search,
    size: 26,
  );
  late bool _IsSearching;
  String _searchText = "";
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
                      color: Colors.white,
                    ),
                    controller: _hi,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 26,
                        color: white,
                      ),
                      hintText: "Search",
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
                    'Choose chat',
                  );
                }
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, i) => Column(
          children: <Widget>[
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(dummyData[i].avatarUrl),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      dummyData[i].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dummyData[i].time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.done_all,
                        size: 20,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        dummyData[i].message,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
