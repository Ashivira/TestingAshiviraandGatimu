import 'package:flutter/material.dart';
import 'package:wardrobepages/utilities/drawer_data.dart';

class SizeGuideScreen extends StatelessWidget {
  const SizeGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE4E1), // Dark blue background
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE4E1),
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            const Text(
              "Size Guide",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F1B2B)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            const Text(
              "Measurement Instructions",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F1B2B)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Measurement Instructions
            _buildInstruction(
                "• Chest: Measure around the fullest part of your chest."),
            _buildInstruction(
                "• Waist: Measure at the narrowest part of your waistline."),
            _buildInstruction(
                "• Hips: Measure around the widest part of your hips."),
            const SizedBox(height: 20),

            // Size Chart Section
            const Text(
              "Size Chart",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F1B2B)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Men's Trousers Size Guide
            _buildImage("assets/mens_size_chart.png"),
            const SizedBox(height: 15),

            // Women's Trousers Size Guide
            _buildImage("assets/womens_size_chart.png"),
            const SizedBox(height: 15),

            // Unisex Size Chart
            _buildImage("assets/unisex_size_chart.png"),
            const SizedBox(height: 30),

            // Customer Support Message
            const Text(
              "STILL NOT SURE? CONTACT CUSTOMER SUPPORT.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0F1B2B)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInstruction(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Color(0xFF0F1B2B)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildImage(String assetPath) {
    return Center(
      child: Image.asset(
        assetPath,
        width: 300, // Adjust width if necessary
        fit: BoxFit.contain,
      ),
    );
  }
}
