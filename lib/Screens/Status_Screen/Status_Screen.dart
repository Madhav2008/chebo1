// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, file_names, avoid_print, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/Camera_Screen/Camera_Screen.dart';
import 'package:whatsapp/Screens/Story_Page/Story_Page.dart';
import 'package:whatsapp/Screens/Text_Status_Screen/Text_Status_Screen.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Widgets/Status_Card.dart';

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
    String name6 = 'Joe';
    String name7 = 'Harry';
    String name8 = 'Edward';

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
    String avatar6 =
        'https://www.mnp.ca/-/media/foundation/integrations/personnel/2020/12/16/13/57/personnel-image-4483.jpg?h=800&w=600&hash=9D5E5FCBEE00EB562DCD8AC8FDA8433D';
    String avatar7 =
        'https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg';
    String avatar8 =
        'https://ebizfiling.com/wp-content/uploads/2017/12/images_20-3.jpg';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => CameraScreen(
                      cameras: [],
                    ),
                  ),
                );
              },
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
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
                        color: white,
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
                "myStatus".tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("tapToAddStatusUpdate".tr),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: grey.withOpacity(0.1),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 15,
                ),
                child: Text(
                  "recentUpdates".tr,
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPageView(
                        // name: name,
                        // avatar: avatar,
                        ),
                  ),
                );
              },
              child: StatusCard(
                name: name,
                time: "Today, 13:16 PM",
                image: avatar,
                isSeen: false,
                statusNum: 3,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPageView(
                        // name: name1,
                        // avatar: avatar1,
                        ),
                  ),
                );
              },
              child: StatusCard(
                name: name1,
                time: "Today, 11:45 AM",
                image: avatar1,
                isSeen: false,
                statusNum: 1,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPageView(
                        // name: name2,
                        // avatar: avatar2,
                        ),
                  ),
                );
              },
              child: StatusCard(
                name: name2,
                time: "Yesterday, 16:20 PM",
                image: avatar2,
                isSeen: false,
                statusNum: 10,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: grey.withOpacity(0.1),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 15,
                ),
                child: Text(
                  "viewedUpdates".tr,
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPageView(
                        // name: name3,
                        // avatar: avatar3,
                        ),
                  ),
                );
              },
              child: StatusCard(
                name: name3,
                time: "Today, 13:16 PM",
                image: avatar3,
                isSeen: true,
                statusNum: 3,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPageView(
                        // name: name4,
                        // avatar: avatar4,
                        ),
                  ),
                );
              },
              child: StatusCard(
                name: name4,
                time: "Today, 11:45 AM",
                image: avatar4,
                isSeen: true,
                statusNum: 1,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPageView(
                        // name: name5,
                        // avatar: avatar5,
                        ),
                  ),
                );
              },
              child: StatusCard(
                name: name5,
                time: "Yesterday, 16:20 PM",
                image: avatar5,
                isSeen: true,
                statusNum: 10,
              ),
            ),
            Theme(
              data: ThemeData().copyWith(
                dividerColor: transparent,
              ),
              child: ExpansionTile(
                iconColor: grey,
                collapsedIconColor: grey,
                title: Text(
                  "mutedUpdates".tr,
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryPageView(
                            // name: name6,
                            avatar: avatar6,
                          ),
                        ),
                      );
                    },
                    child: StatusCard(
                      name: name6,
                      time: "Yesterday, 16:30 PM",
                      image: avatar6,
                      isSeen: false,
                      statusNum: 6,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryPageView(
                            name: name7,
                            avatar: avatar7,
                          ),
                        ),
                      );
                    },
                    child: StatusCard(
                      name: name7,
                      time: "Yesterday, 18:10 PM",
                      image: avatar7,
                      isSeen: false,
                      statusNum: 3,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryPageView(
                            name: name8,
                            avatar: avatar8,
                          ),
                        ),
                      );
                    },
                    child: StatusCard(
                      name: name8,
                      time: "Today, 12:20 PM",
                      image: avatar8,
                      isSeen: false,
                      statusNum: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: grey[100],
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
                color: grey[900],
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
                  builder: (BuildContext context) => CameraScreen(
                    cameras: [],
                  ),
                ),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
