import 'package:flutter/material.dart';
import '../utilities/drawer_data.dart';
import 'my_details_page.dart';
import 'recommended_stores_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        backgroundColor: const Color(0xFFFFE4E1),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFE4E1),
          elevation: 0,

          // Back Button
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          // Logo
          title: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => RecommendedStoresPage()),
                (route) => false, // Clears the navigation stack
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/logo.png', height: 40),
                const SizedBox(width: 8), // Adds spacing between icon and text
                const Text(
                  "About Wardrobe",
                  style: TextStyle(
                    fontSize: 18, // Adjust size as needed
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          actions: [
            IconButton(
              icon: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/joe_profile_2.jpg'),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDetailsPage()),
                );
              },
            ),
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ],
        ),
        body: const SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'A virtual try on solution using Google MediaPipe and a 3D modelling solution.',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        )));
  }
}
