import 'package:untitled1/constans.dart';

class MessageModel {
  final String message;
  final String email;
  MessageModel(this.message, this.email);
  factory MessageModel.fromJeson(jesonData) {
    return MessageModel(jesonData[kMessagesCollections], jesonData['id']);
  }
}
