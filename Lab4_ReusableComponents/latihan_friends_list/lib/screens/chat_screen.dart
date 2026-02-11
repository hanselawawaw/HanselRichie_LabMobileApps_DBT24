import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/message_model.dart';
import '../data/mock_data.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final UserModel user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  late List<MessageModel> messages;

  @override
  void initState() {
    super.initState();
    messages = List.from(MockData.messages[widget.user.name] ?? []);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();
    });
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  void sendTextMessage() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      messages.add(
        MessageModel(
          text: controller.text,
          isMe: true,
        ),
      );
    });

    controller.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      scrollToBottom();
    });
  }

  void sendVoiceMessage() {
    setState(() {
      messages.add(
        MessageModel(
          text: "voice",
          isMe: true,
          isVoice: true,
        ),
      );
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f9ff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage(widget.user.image),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: const [
                Text(
                  "Online",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(15),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: messages[index],
                );
              },
            ),
          ),

          // INPUT AREA
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black12,
                )
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: sendVoiceMessage,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff667eea),
                          Color(0xff764ba2)
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Write a message...",
                      filled: true,
                      fillColor:
                          const Color(0xffeef1f7),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(
                              horizontal: 20),
                    ),
                    onSubmitted: (_) => sendTextMessage(),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: sendTextMessage,
                  child: const Icon(
                    Icons.send,
                    color: Color(0xff667eea),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
