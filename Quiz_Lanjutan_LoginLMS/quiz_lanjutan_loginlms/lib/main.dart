import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// =====================
// LOGIN PAGE
// =====================
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image (masih dari network, sesuai kode kamu)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://officemaster.ae/img/2023/04/Ideal-Desk-Setups-for-Working-from-Home.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay gelap
          Container(color: Colors.black.withOpacity(0.5)),

          // Login Card
          Center(
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // LOGO ASSET
                  Image.asset(
                    'assets/images/logopm.png',
                    height: 60,
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'USERNAME',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainNavigation(),
                          ),
                        );
                      },
                      child: const Text('Log in'),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Lost password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================
// MAIN NAVIGATION
// =====================
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    LibraryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// =====================
// HOME PAGE
// =====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showMessage(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("$title clicked"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void showBottomMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              menuItem(context, "admission"),
              menuItem(context, "people"),
              menuItem(context, "laboratory"),
              menuItem(context, "campus life"),
              menuItem(context, "office & services"),
            ],
          ),
        );
      },
    );
  }

  Widget menuItem(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          showMessage(context, title);
        },
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset(
          'assets/images/logopm.png',
          height: 36,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => showBottomMenu(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                'assets/images/logopm.png',
                height: 140,
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "VISION",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "A globally recognized School for STEMpreneur Education and Research",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "MISSION",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Provide quality STEM education and research for nurturing the holistic citizen graduates through:\n\n"
                "1. Collaborative learning by enterprising involving interdisciplinary catalytic projects\n"
                "2. Innovative and impactful research to the society",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 120),

            // FOOTER
            Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logopm.png',
                      height: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "BSD City Kavling Edutown I.1\n"
                    "Jl. BSD Raya Utama, BSD City 15339\n"
                    "Kabupaten Tangerang, Indonesia\n\n"
                    "Tel. (021) 304-50-500\n"
                    "Email: info@prasetiyamulya.ac.id",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================
// LIBRARY PAGE
// =====================
class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Library Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// =====================
// PROFILE PAGE
// =====================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Profile Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
