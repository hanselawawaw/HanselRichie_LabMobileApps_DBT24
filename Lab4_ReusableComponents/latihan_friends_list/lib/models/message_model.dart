class MessageModel {
  final String text;
  final bool isMe;
  final bool isVoice;

  MessageModel({
    required this.text,
    required this.isMe,
    this.isVoice = false,
  });
}
