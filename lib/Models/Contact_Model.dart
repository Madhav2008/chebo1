// ignore_for_file: file_names

class ChatModel {
  String name;
  String status;
  bool select = false;
  ChatModel({
    required this.name,
    required this.status,
    this.select = false,
  });

  startsWith(list) {}

  where(Function(dynamic p) param0) {}
}