import 'package:dart_mc_ping/model/chat_object.dart';

class Description {
  final ChatObject chatObject;
  final String text;

  Description.fromJson(Map<String, dynamic> json)
      : chatObject = json['description'] is String
            ? null
            : ChatObject.fromJson(json['description']),
        text = json['description'] is String ? json['description'] : null;

  @override
  String toString() {
    return 'Description{chatObject: $chatObject, text: $text}';
  }
}
