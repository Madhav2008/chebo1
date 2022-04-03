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
      StoryItem.text(
        title: '''Hey ! ''' + name + ''' This Side.''',
        backgroundColor: red,
      ),
      StoryItem.pageImage(
        url: avatar,
        controller: _storyController,
      ),
      // StoryItem.pageImage(
      //   url:
      //       "https://media-exp1.licdn.com/dms/image/C4E16AQFHB9TkUDyiWg/profile-displaybackgroundimage-shrink_200_800/0/1634717346543?e=1650499200&v=beta&t=cjVjvtVo8QmqMzWEbRH02f9q5AWNbPqnmUPeIZnLj7I",
      //   controller: _storyController,
      // ),
      StoryItem.pageImage(
        url: "https://media2.giphy.com/media/j4fbBhYgu8mNEHkQ4w/giphy.gif",
        controller: _storyController,
        imageFit: BoxFit.contain,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        
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
