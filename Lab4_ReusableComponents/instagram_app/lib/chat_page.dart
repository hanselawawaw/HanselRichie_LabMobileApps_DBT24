import 'package:flutter/material.dart';
import 'detail_chat_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> chatUsers = [
      "hanselrichie",
      "rafael_23",
      "gladys_01",
      "isabelle",
      "vincent",
      "lee_",
      "retiredperson_",
      "patzk",
      "dukun_h4ndal",
      "victormarlin_",
      "oliverdennis_",
      "peterbryant.mp4",
      "valentino_ricci",
      "jokowi",
      "ryan_hartono_",
      "360widespread",
      "shrnantoni",
      "sharky2kd",
      "runa.l4w",
      "jnnfrashley",
      "alt_fif",
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),

     appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
  title: const Text(
    "Messages",
    style: TextStyle(
      color: Colors.white,
    ),
  ),
),


      body: ListView.builder(
        itemCount: chatUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 181, 86, 86),
            ),
            title: Text(
              chatUsers[index],
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              "Active 2h ago",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailChatPage(username: chatUsers[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
