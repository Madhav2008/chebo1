// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:whatsapp/Constants/Constants.dart';

class StoryPageView extends StatelessWidget {
  final _storyController = StoryController();

  StoryPageView({
    Key? key,
    required this.name,
    required this.avatar,
  }) : super(key: key);

  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      // StoryItem.text(
      //   title: '''Hey ! ''' + name + ''' This Side.''',
      //   backgroundColor: red,
      // ),
      // StoryItem.pageImage(
      //   url: avatar,
      //   controller: _storyController,
      // ),
      // // StoryItem.pageImage(
      // //   url:
      // //       "https://media-exp1.licdn.com/dms/image/C4E16AQFHB9TkUDyiWg/profile-displaybackgroundimage-shrink_200_800/0/1634717346543?e=1650499200&v=beta&t=cjVjvtVo8QmqMzWEbRH02f9q5AWNbPqnmUPeIZnLj7I",
      // //   controller: _storyController,
      // // ),
      // StoryItem.pageImage(
      //   url: "https://media2.giphy.com/media/j4fbBhYgu8mNEHkQ4w/giphy.gif",
      //   controller: _storyController,
      //   imageFit: BoxFit.contain,
      // ),
      StoryItem.text(
        title: '''Hey ! ''' + name + ''' This Side.''',
        backgroundColor: one,
      ),
      StoryItem.text(
        title: "I guess you'd love to see more of our food. That's great.",
        backgroundColor: Colors.blue,
      ),
      StoryItem.text(
        title: "Nice!\n\nTap to continue.",
        backgroundColor: Colors.red,
        textStyle: TextStyle(
          fontFamily: 'Dancing',
          fontSize: 40,
        ),
      ),
      StoryItem.pageImage(
        url:
            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
        caption: "Still sampling",
        controller: storyController,
      ),
      StoryItem.pageImage(
        url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
        caption: "Working with gifs",
        controller: storyController,
      ),
      StoryItem.pageImage(
        url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
        caption: "Hello, from the other side",
        controller: storyController,
      ),
      StoryItem.pageImage(
        url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
        caption: "Hello, from the other side2",
        controller: storyController,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: black,
        elevation: 0,
      ),
      body: Material(
        child: StoryView(
          storyItems: storyItems,
          controller: controller,
          inline: true,
          onVerticalSwipeComplete: (context) => _go,
          onComplete: () {
            Navigator.pop(context, true);
          },
        ),
      ),
    );
  }

  _go(context) {
    Navigator.pop(context, true);
  }
}

// final StoryController controller = StoryController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Delicious Ghanaian Meals"),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(
//           8,
//         ),
//         child: ListView(
//           children: <Widget>[
//             Container(
//               height: 300,
//               child: StoryView(
//                 controller: controller,
//                 storyItems: [
//                   StoryItem.text(
//                     title:
//                         "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
//                     backgroundColor: Colors.orange,
//                     roundedTop: true,
//                   ),
//                   // StoryItem.inlineImage(
//                   //   NetworkImage(
//                   //       "https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg"),
//                   //   caption: Text(
//                   //     "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
//                   //     style: TextStyle(
//                   //       color: Colors.white,
//                   //       backgroundColor: Colors.black54,
//                   //       fontSize: 17,
//                   //     ),
//                   //   ),
//                   // ),
//                   StoryItem.inlineImage(
//                     url:
//                         "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
//                     controller: controller,
//                     caption: Text(
//                       "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
//                       style: TextStyle(
//                         color: Colors.white,
//                         backgroundColor: Colors.black54,
//                         fontSize: 17,
//                       ),
//                     ),
//                   ),
//                   StoryItem.inlineImage(
//                     url:
//                         "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
//                     controller: controller,
//                     caption: Text(
//                       "Hektas, sektas and skatad",
//                       style: TextStyle(
//                         color: Colors.white,
//                         backgroundColor: Colors.black54,
//                         fontSize: 17,
//                       ),
//                     ),
//                   )
//                 ],
//                 onStoryShow: (s) {
//                   print("Showing a story");
//                 },
//                 onComplete: () {
//                   print("Completed a cycle");
//                 },
//                 progressPosition: ProgressPosition.bottom,
//                 repeat: false,
//                 inline: true,
//               ),
//             ),
//             Material(
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => MoreStories()));
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.black54,
//                       borderRadius:
//                           BorderRadius.vertical(bottom: Radius.circular(8))),
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         Icons.arrow_forward,
//                         color: Colors.white,
//                       ),
//                       SizedBox(
//                         width: 16,
//                       ),
//                       Text(
//                         "View more stories",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MoreStories extends StatefulWidget {
//   @override
//   _MoreStoriesState createState() => _MoreStoriesState();
// }

// class _MoreStoriesState extends State<MoreStories> {
//   final storyController = StoryController();

//   @override
//   void dispose() {
//     storyController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("More"),
//       ),
//       body: StoryView(
//         storyItems: [
//           StoryItem.text(
//             title: "I guess you'd love to see more of our food. That's great.",
//             backgroundColor: Colors.blue,
//           ),
//           StoryItem.text(
//             title: "Nice!\n\nTap to continue.",
//             backgroundColor: Colors.red,
//             textStyle: TextStyle(
//               fontFamily: 'Dancing',
//               fontSize: 40,
//             ),
//           ),
//           StoryItem.pageImage(
//             url:
//                 "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
//             caption: "Still sampling",
//             controller: storyController,
//           ),
//           StoryItem.pageImage(
//               url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
//               caption: "Working with gifs",
//               controller: storyController),
//           StoryItem.pageImage(
//             url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
//             caption: "Hello, from the other side",
//             controller: storyController,
//           ),
//           StoryItem.pageImage(
//             url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
//             caption: "Hello, from the other side2",
//             controller: storyController,
//           ),
//         ],
//         onStoryShow: (s) {
//           print("Showing a story");
//         },
//         onComplete: () {
//           print("Completed a cycle");
//         },
//         progressPosition: ProgressPosition.top,
//         repeat: false,
//         controller: storyController,
//       ),
//     );
//   }
// }