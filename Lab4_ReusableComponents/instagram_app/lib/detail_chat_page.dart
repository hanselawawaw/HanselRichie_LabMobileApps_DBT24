import 'package:flutter/material.dart';

class DetailChatPage extends StatelessWidget {

  final String username;

  const DetailChatPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

    appBar: AppBar(
  backgroundColor: Colors.black,
  title: Text(
    username,
    style: const TextStyle(
      color: Colors.white,
    ),
  ),
),


      body: Column(
        children: [

          const Expanded(
            child: Center(
              child: Text(
                "Chat Room",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[900],
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Message...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
