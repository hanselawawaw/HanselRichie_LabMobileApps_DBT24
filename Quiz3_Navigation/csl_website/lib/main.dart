import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // popup ketika menu diklik
  void showMessage(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("$title clicked"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // bottom sidebar (tidak fullscreen)
  void showBottomMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(
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
          style: TextStyle(
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
      backgroundColor: Colors.white,

      // ===== HEADER =====
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.network(
          "https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png",
          height: 36,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              showBottomMenu(context);
            },
          ),
        ],
      ),

      // ===== BODY =====
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LOGO BESAR ATAS
            Padding(
              padding: EdgeInsets.all(16),
              child: Image.network(
                "https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png",
                height: 140,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "VISION",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "A globally recognized School for STEMpreneur Education and Research",
                style: TextStyle(fontSize: 16),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "MISSION",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Provide quality STEM education and research for nurturing the holistic citizen graduates through:\n\n"
                "1. Collaborative learning by enterprising involving interdisciplinary catalytic projects\n"
                "2. Innovative and impactful research to the society\n\n"
                "Provide quality STEM education and research for nurturing the holistic citizen graduates through:\n"
                "1. Collaborative learning by enterprising involving interdisciplinary catalytic projects\n"
                "2. Innovative and impactful research to the society",
                style: TextStyle(fontSize: 16),
              ),
            ),

            // JARAK SUPAYA FOOTER TIDAK LANGSUNG TERLIHAT
            SizedBox(height: 120),

            // ===== FOOTER HITAM =====
            Container(
              width: double.infinity,
              color: Colors.black,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LOGO DI DALAM FOOTER (ATAS)
                  Center(
                    child: Image.network(
                      "https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png",
                      height: 60,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    "BSD City Kavling Edutown I.1\n"
                    "Jl. BSD Raya Utama, BSD City 15339\n"
                    "Kabupaten Tangerang, Indonesia\n\n"
                    "Tel. (021) 304-50-500\n"
                    "Email: info@prasetiyamulya.ac.id",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
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
