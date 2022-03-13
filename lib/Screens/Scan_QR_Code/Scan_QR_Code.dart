// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, file_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Screens/View_Photo/View_Photo.dart';
import 'package:whatsapp/main.dart';

class ScanQRCodeScreen extends StatefulWidget {
  ScanQRCodeScreen({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription> cameras;

  @override
  _ScanQRCodeScreenState createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  final ImagePicker _picker = ImagePicker();
  XFile? file;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
    Future.delayed(Duration(seconds: 0), () {
      showDialog(
        context: context,
        builder: (builder) => _aboutScanning(context),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CameraPreview(_cameraController),
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
          Positioned(
            bottom: 150,
            child: Column(
              children: [
                Icon(
                  Icons.crop_free_sharp,
                  size: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 10),
                Text(
                  'Scan WhatsApp India QR Code',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: transparent,
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Transform.rotate(
                            angle: transform,
                            child: Icon(
                              Icons.photo_library,
                              color: white,
                              size: 28,
                            ),
                          ),
                          onPressed: () async {
                            file = await _picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => CameraViewPage(
                                  path: file!.path,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: white,
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => CameraViewPage(
          path: file.path,
        ),
      ),
    );
  }

  Widget _aboutScanning(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Scan WhatsApp India QR Code",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: one,
                    width: 150,
                    height: 40,
                    child: Center(
                      child: Text('OK'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
