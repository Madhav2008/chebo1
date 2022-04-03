// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, file_names

import 'dart:math';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/main.dart';

class WhatsAppVideoCallingScreen extends StatefulWidget {
  WhatsAppVideoCallingScreen({
    Key? key,
    required this.cameras,
    required this.avatar,
    required this.name,
  }) : super(key: key);

  final List<CameraDescription> cameras;
  final String avatar;
  final String name;

  @override
  _WhatsAppVideoCallingScreenState createState() =>
      _WhatsAppVideoCallingScreenState();
}

class _WhatsAppVideoCallingScreenState
    extends State<WhatsAppVideoCallingScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool mic = false;
  bool hangUp = false;
  bool camera = false;
  bool iscamerafront = true;
  double transform = 0;
  bool calling = true;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );
    cameraValue = _cameraController.initialize();
  }

  void main() {
    // AssetsAudioPlayer.newPlayer().open(
    //   Audio(
    //     "../assets/sounds/calling.mp3",
    //   ),
    //   autoStart: true,
    //   showNotification: true,
    //   // loopMode: LoopMode.single,
    // );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _cameraController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                setState(() {
                  calling = false;
                });
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: camera
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                        )
                      : CameraPreview(_cameraController),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: one,
                  ),
                );
              }
            },
          ),
          calling?Positioned(
            top: 30.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(widget.avatar),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ringing',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ):Container(),
          Positioned(
            bottom: 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: grey,
                    size: 30,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Transform.rotate(
                          angle: transform,
                          child: Icon(
                            Icons.flip_camera_ios,
                            color: white,
                            size: 28,
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            iscamerafront = !iscamerafront;
                            transform = transform + pi;
                          });
                          int cameraPos = iscamerafront ? 0 : 1;
                          _cameraController = CameraController(
                            cameras[cameraPos],
                            ResolutionPreset.high,
                          );
                          cameraValue = _cameraController.initialize();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          camera ? Icons.videocam : Icons.videocam_off,
                          color: white,
                          size: 28,
                        ),
                        onPressed: () {
                          if (camera == true) {
                            setState(() {
                              camera = false;
                            });
                          } else {
                            setState(() {
                              camera = true;
                            });
                          }
                          // camera
                          //     ? _cameraController.dispose()
                          //     : _cameraController.dispose();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          mic ? Icons.mic : Icons.mic_off,
                          color: white,
                          size: 28,
                        ),
                        onPressed: () {
                          setState(() {
                            mic = !mic;
                          });
                          mic ? _cameraController : _cameraController;
                        },
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          color: red,
                          icon: Icon(
                            Icons.call_end,
                            color: white,
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              hangUp = !hangUp;
                            });
                            hangUp ? Navigator.pop(context) : _cameraController;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
