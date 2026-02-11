import 'package:flutter/material.dart';
import '../models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          gradient: message.isMe
              ? const LinearGradient(
                  colors: [Color(0xff667eea), Color(0xff764ba2)],
                )
              : const LinearGradient(
                  colors: [Color(0xffe0eafc), Color(0xffcfdef3)],
                ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: message.isVoice
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.play_arrow, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "Voice Message",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            : Text(
                message.text,
                style: TextStyle(
                  color:
                      message.isMe ? Colors.white : Colors.black87,
                  fontSize: 15,
                ),
              ),
      ),
    );
  }
}
