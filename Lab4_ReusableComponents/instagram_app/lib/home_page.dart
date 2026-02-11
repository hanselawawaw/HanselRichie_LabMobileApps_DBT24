import 'package:flutter/material.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> usernames = [
    "alaiamirdad",
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

  List<String> feedImages = [
    "assets/post1.jpg",
    "assets/post2.jpg",
    "assets/post3.jpg",
    "assets/post4.jpg",
    "assets/post5.jpg",
    "assets/post6.jpg",
    "assets/post7.jpg",
    "assets/post8.jpg",
    "assets/post9.jpg",
    "assets/post10.jpg",
    "assets/post11.jpg",
    "assets/post12.jpg",
    "assets/post13.jpg",
    "assets/psot14.jpg",
    "assets/post15.jpg",
    "assets/post16.jpg",
    "assets/post17.jpg",
    "assets/post18.jpg",
    "assets/post19.jpg",
    "assets/post20.jpg",
    "assets/post21.webp",
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

     appBar: AppBar(
  backgroundColor: Colors.black,
  title: const Text(
    "Instagram",
    style: TextStyle(
      color: Colors.white,
    ),
  ),
),


      body: SingleChildScrollView(
        child: Column(
          children: [

            // STORY
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: usernames.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.pink,
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 70,
                          child: Text(
                            usernames[index],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            const Divider(color: Colors.grey),

            // FEED
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: feedImages.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        usernames[index % usernames.length],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),

                    SizedBox(
                      height: 300,
                      child: PageView(
                        children: [
                          Image.asset(
                            feedImages[index],
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            feedImages[
                                (index + 1) % feedImages.length],
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "❤️ 120 likes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ""),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
