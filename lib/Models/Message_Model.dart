// ignore_for_file: file_names

class MessageModel {
  String type;
  String message;
  String time;
  bool unread;
  String path;
  MessageModel({
    required this.message,
    required this.type,
    required this.time,
    required this.unread,
    required this.path,
  });
}
