import 'package:flutter/material.dart';
import 'package:wardrobepages/Pages/edit_details.dart';

class MyDetailsPage extends StatelessWidget {
  const MyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B2B), // Dark blue background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1B2B),
        elevation: 0,
        title: const Text(
          "My Details",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User icon
              const Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 20),

              // Static user details (Hardcoded)
              _buildDetailField("First Name", "John"),
              _buildDetailField("Last Name(S)", "Doe"),
              _buildDetailField("Email", "johndoe@example.com"),

              const SizedBox(height: 20),

              // Edit Details Button (Navigates to Edit Details Page)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditDetailsPage()), // Navigate to Edit Page
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDDCDC), // Light pink background
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Edit Details",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to display user details
  Widget _buildDetailField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFFDDCDC), // Light pink background
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
