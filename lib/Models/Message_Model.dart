// ignore_for_file: file_names

import 'package:whatsapp/Models/User_Model.dart';

class MessageModel {
  String type;
  User sender;
  String message;
  String time;
  bool unread;
  MessageModel({
    required this.message,
    required this.type,
    required this.sender,
    required this.time,
    required this.unread,
  });
}

final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: '',
);
