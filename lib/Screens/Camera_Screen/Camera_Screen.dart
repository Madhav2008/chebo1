// // ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, file_names

// import 'dart:math';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:whatsapp/Constants/Constants.dart';
// import 'package:whatsapp/Screens/View_Photo/View_Photo.dart';
// import 'package:whatsapp/Screens/View_Video/View_Video.dart';
// import 'package:whatsapp/main.dart';

// class CameraScreen extends StatefulWidget {
//   CameraScreen({Key? key, required this.cameras}) : super(key: key);

//   final List<CameraDescription> cameras;

//   @override
//   _CameraScreenState createState() {
//     return _CameraScreenState();
//   }
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController _cameraController;
//   late Future<void> cameraValue;
//   bool isRecoring = false;
//   bool flash = false;
//   bool iscamerafront = true;
//   double transform = 0;

//   @override
//   void initState() {
//     super.initState();
//     _cameraController = CameraController(cameras[0], ResolutionPreset.high);
//     cameraValue = _cameraController.initialize();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _cameraController.dispose();
//   }

//   Widget _buildGalleryBar() {
//     final barHeight = 90.0;
//     final vertPadding = 10.0;

//     return Container(
//       height: barHeight,
//       child: ListView.builder(
//         padding: EdgeInsets.symmetric(vertical: vertPadding),
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int _) {
//           return Container(
//             padding: EdgeInsets.only(right: 5.0),
//             width: 70.0,
//             height: barHeight - vertPadding * 2,
//             child: Image(
//               image: NetworkImage(
//                   'https://raw.githubusercontent.com/ng-kode/whatsapp_clone/master/assets/150x150.png'),
//               fit: BoxFit.cover,
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           FutureBuilder(
//             future: cameraValue,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   child: CameraPreview(_cameraController),
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     color: one,
//                   ),
//                 );
//               }
//             },
//           ),
//           Positioned(
//             bottom: 0.0,
//             child: Container(
//               color: transparent,
//               padding: EdgeInsets.only(
//                 top: 5,
//                 bottom: 5,
//               ),
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.keyboard_arrow_up,
//                     color: white,
//                   ),
//                   _buildGalleryBar(),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                           icon: Icon(
//                             flash ? Icons.flash_on : Icons.flash_off,
//                             color: white,
//                             size: 28,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               flash = !flash;
//                             });
//                             flash
//                                 ? _cameraController
//                                     .setFlashMode(FlashMode.torch)
//                                 : _cameraController.setFlashMode(FlashMode.off);
//                           }),
//                       GestureDetector(
//                         onLongPress: () async {
//                           await _cameraController.startVideoRecording();
//                           setState(() {
//                             isRecoring = true;
//                           });
//                         },
//                         onLongPressUp: () async {
//                           XFile videopath =
//                               await _cameraController.stopVideoRecording();
//                           setState(() {
//                             isRecoring = false;
//                           });
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (builder) {
//                                 return VideoViewPage(
//                                   path: videopath.path,
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         onTap: () {
//                           if (!isRecoring) takePhoto(context);
//                         },
//                         child: isRecoring
//                             ? Icon(
//                                 Icons.radio_button_on,
//                                 color: red,
//                                 size: 80,
//                               )
//                             : Icon(
//                                 Icons.panorama_fish_eye,
//                                 color: white,
//                                 size: 70,
//                               ),
//                       ),
//                       IconButton(
//                           icon: Transform.rotate(
//                             angle: transform,
//                             child: Icon(
//                               Icons.flip_camera_ios,
//                               color: white,
//                               size: 28,
//                             ),
//                           ),
//                           onPressed: () async {
//                             setState(() {
//                               iscamerafront = !iscamerafront;
//                               transform = transform + pi;
//                             });
//                             int cameraPos = iscamerafront ? 0 : 1;
//                             _cameraController = CameraController(
//                                 cameras[cameraPos], ResolutionPreset.high);
//                             cameraValue = _cameraController.initialize();
//                           }),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Hold for Video, tap for photo",
//                     style: TextStyle(
//                       color: white,
//                     ),
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void takePhoto(BuildContext context) async {
//     XFile file = await _cameraController.takePicture();
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (builder) {
//           return CameraViewPage(
//             path: file.path,
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class CameraScreen extends StatefulWidget {
  final bool needScaffold;

  CameraScreen({this.needScaffold = false});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  int _cameraIndex = 0;
  bool _cameraNotAvailable = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showInSnackBar(String message) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _initCamera(int index) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameras[index], ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        _showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {
        _cameraIndex = index;
      });
    }
  }

  void _onSwitchCamera() {
    if (controller == null ||
        !controller.value.isInitialized ||
        controller.value.isTakingPicture) {
      return;
    }
    final newIndex = _cameraIndex + 1 == cameras.length ? 0 : _cameraIndex + 1;
    _initCamera(newIndex);
  }

  void _onTakePictureButtonPress() {
    _takePicture().then((filePath) {
      if (filePath != null) {
        // _showInSnackBar('Picture saved to $filePath');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.crop_rotate),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.insert_emoticon),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.text_fields),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
            body: Container(
              color: Colors.black,
              child: Center(
                child: Image.file(File(filePath)),
              ),
            ),
          );
        }));
      }
    });
  }

  String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<String> _takePicture() async {
    if (!controller.value.isInitialized || controller.value.isTakingPicture) {
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/whatsapp_clone';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${_timestamp()}.jpg';

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    _showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  Widget _buildGalleryBar() {
    final barHeight = 90.0;
    final vertPadding = 10.0;

    return Container(
      height: barHeight,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: vertPadding),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int _) {
          return Container(
            padding: EdgeInsets.only(right: 5.0),
            width: 70.0,
            height: barHeight - vertPadding * 2,
            child: Image(
              image: randomImageUrl(),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _buildControlBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.flash_auto),
          onPressed: () {},
        ),
        GestureDetector(
          onTap: _onTakePictureButtonPress,
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
            ),
          ),
        ),
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.switch_camera),
          onPressed: _onSwitchCamera,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    if (cameras == null || cameras.isEmpty) {
      setState(() {
        _cameraNotAvailable = true;
      });
    }
    _initCamera(_cameraIndex);
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraNotAvailable) {
      final center = Center(
        child: Text('Camera not available /_\\'),
      );

      if (widget.needScaffold) {
        return Scaffold(
          appBar: AppBar(),
          body: center,
        );
      }

      return center;
    }

    final stack = Stack(
      children: <Widget>[
        Container(
          color: Colors.black,
          child: Center(
            child: controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: CameraPreview(controller),
                  )
                : Text('Loading camera...'),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _buildGalleryBar(),
            _buildControlBar(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Tap for photo',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        )
      ],
    );

    if (widget.needScaffold) {
      return Scaffold(
        body: stack,
      );
    }

    return stack;
  }

  @override
  void dispose() {
    super.dispose();
    if (controller != null) {
      controller.dispose();
    }
  }
}
