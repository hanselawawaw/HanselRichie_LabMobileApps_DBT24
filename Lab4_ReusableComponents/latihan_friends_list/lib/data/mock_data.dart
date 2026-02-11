import '../models/user_model.dart';
import '../models/message_model.dart';

class MockData {

  // ================= USERS =================
  static List<UserModel> users = [
    UserModel(
      name: "Ricci",
      image: "assets/ricis.jpeg",
    ),
    UserModel(
      name: "Samuel",
      image: "assets/samuek.jpeg",
    ),
    UserModel(
      name: "Deaven",
      image: "assets/dip.jpeg",
    ),
  ];

  // ================= MESSAGES =================
  static Map<String, List<MessageModel>> messages = {
    "Ricci": [
      MessageModel(
        text: "Halo mek",
        isMe: false,
      ),
      MessageModel(
        text: "Bacot lu?",
        isMe: false,
      ),
      MessageModel(
        text: "Lah kontol",
        isMe: true,
      ),
      MessageModel(
        text: "voice",
        isMe: false,
        isVoice: true,
      ),
    ],

    "Samuel": [
      MessageModel(
        text: "Besok jadi swill?",
        isMe: false,
      ),
      MessageModel(
        text: "Gas",
        isMe: true,
      ),
    ],

    "Deaven": [
      MessageModel(
        text: "Padel",
        isMe: false,
      ),
      MessageModel(
        text: "OKKKKKEE",
        isMe: true,
      ),
    ],
  };
}
