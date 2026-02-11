import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/contact_card.dart';
import 'chat_screen.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff4facfe), Color(0xff00f2fe)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 15),
        itemCount: MockData.users.length,
        itemBuilder: (context, index) {
          final user = MockData.users[index];

          return ContactCard(
            user: user,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
