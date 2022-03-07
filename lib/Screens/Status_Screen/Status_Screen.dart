// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, file_names, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Camera_Screen/Camera_Screen.dart';
import 'package:whatsapp/Screens/Story_Page/Story_Page.dart';
import 'package:whatsapp/Screens/Text_Status_Screen/Text_Status_Screen.dart';

class StatusScreen extends StatelessWidget {
  StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = 'Madhav Arora';
    String name1 = 'Bill Gates';
    String name2 = 'Raghav Arora';
    String name3 = 'John';
    String name4 = 'Adam';
    String name5 = 'Jack';

    String avatar =
        'https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4';
    String avatar1 =
        'https://pbs.twimg.com/profile_images/1414439092373254147/JdS8yLGI_400x400.jpg';
    String avatar2 = 'https://avatars.githubusercontent.com/u/66276244?v=4';
    String avatar3 =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5cqFuNuQc-evg5bzAK6Ro5ObXPyuPf4EgYQ&usqp=CAU';
    String avatar4 =
        'https://4bgowik9viu406fbr2hsu10z-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Portrait_5-1.jpg';
    String avatar5 =
        'https://upload.wikimedia.org/wikipedia/commons/2/23/Photo_portrait_PP.jpg';
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    color: white,
                    size: 40,
                  ),
                  backgroundColor: grey,
                ),
                Positioned(
                  bottom: 0.0,
                  right: 1.0,
                  child: Container(
                    height: 20,
                    width: 20,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                    decoration: BoxDecoration(
                      color: secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
            title: Text(
              "My Status",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("Tap to add status update"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Viewed updates",
              style: TextStyle(
                color: pgrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryPageView(
                          name: name,
                          avatar: avatar,
                        ),
                      ),
                    );
                  },
                  child: statusCard(
                    name,
                    "Today, 13:16 PM",
                    avatar,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryPageView(
                          name: name1,
                          avatar: avatar1,
                        ),
                      ),
                    );
                  },
                  child: statusCard(
                    name1,
                    "Today, 11:45 AM",
                    avatar1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryPageView(
                          name: name2,
                          avatar: avatar2,
                        ),
                      ),
                    );
                  },
                  child: statusCard(
                    name2,
                    "Yesterday, 16:20 PM",
                    avatar2,
                  ),
                ),
                Theme(
                  data: ThemeData().copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(8.0),
                    iconColor: grey,
                    collapsedIconColor: grey,
                    title: Text(
                      "Muted updates",
                      style: TextStyle(
                        color: pgrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoryPageView(
                                name: name3,
                                avatar: avatar3,
                              ),
                            ),
                          );
                        },
                        child: statusCard(
                          name3,
                          "Yesterday, 16:30 PM",
                          avatar3,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoryPageView(
                                name: name4,
                                avatar: avatar4,
                              ),
                            ),
                          );
                        },
                        child: statusCard(
                          name4,
                          "Yesterday, 18:10 PM",
                          avatar4,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoryPageView(
                                name: name5,
                                avatar: avatar5,
                              ),
                            ),
                          );
                        },
                        child: statusCard(
                          name5,
                          "Today, 12:20 PM",
                          avatar5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              elevation: 8,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TextStatusScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            backgroundColor: one,
            elevation: 5,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CameraScreen(cameras: []),
                ),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget statusCard(
    String name,
    String time,
    String image,
  ) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
          image,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: white,
        ),
      ),
      subtitle: Text(
        time,
        style: TextStyle(
          color: white,
        ),
      ),
      // onTap: () {},
    );
  }
}
