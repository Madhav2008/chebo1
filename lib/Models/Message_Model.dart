// ignore_for_file: file_names

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
