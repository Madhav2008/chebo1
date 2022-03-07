// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';

class StorageAndDataSettings extends StatefulWidget {
  StorageAndDataSettings({Key? key}) : super(key: key);

  @override
  State<StorageAndDataSettings> createState() => _StorageAndDataSettingsState();
}

class _StorageAndDataSettingsState extends State<StorageAndDataSettings> {
  bool lessDataCalls = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Storage and data',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            right: 8.0,
            left: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.folder,
                  color: grey,
                ),
                title: Text(
                  'Manage storage',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  '1.4 GB',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.data_saver_off_sharp,
                  color: grey,
                ),
                title: Text(
                  'Network usage',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  '1.8 GB sent • 3.3 GB received',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'Use less data for calls',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                trailing: Switch(
                  value: lessDataCalls,
                  onChanged: (value) {
                    setState(() {
                      lessDataCalls = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Media auto-download',
                style: TextStyle(
                  color: grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Voice messages are always automatically downloaded',
                style: TextStyle(
                  color: grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'When using mobile data',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  'Photos',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'When connected on Wi-Fi',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  'All media',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'When roaming',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  'No media',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Media upload quality',
                style: TextStyle(
                  color: grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Choose the quality of media files to be sent',
                style: TextStyle(
                  color: grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'Photo upload quality',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  'Auto (recommended)',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
