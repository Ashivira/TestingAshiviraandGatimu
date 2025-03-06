import 'package:flutter/material.dart';

class ScanningInstructionsScreen extends StatelessWidget {
  const ScanningInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE4E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE4E1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get Ready to Scan',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Follow these tips to get accurate measurements.',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFF000000),
                height: 1.3,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Instruction Section
            Container(
              padding: const EdgeInsets.all(20),
              child: const Column(
                children: [
                  InstructionItem(text: 'Ensure good lighting.', fontSize: 20),
                  SizedBox(height: 20),
                  InstructionItem(
                      text: 'Wear fitted clothing for accurate measurements.',
                      fontSize: 20),
                  SizedBox(height: 20),
                  InstructionItem(
                      text: 'Stand in front of a plain background.',
                      fontSize: 20),
                  SizedBox(height: 20),
                  InstructionItem(
                      text: 'Hold the phone vertically.', fontSize: 20),
                ],
              ),
            ),

            const SizedBox(height: 100),

            // Centered "Let's go!" Text
            const Center(
              child: Text(
                "Let's go!",
                style: TextStyle(
                  fontSize: 50,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Spacer(),

            // Continue Button
            Column(
              children: [
                ElevatedButton(
                  // TODO: Add functionality to open camera
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A2B3C),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'CONTINUE TO SCAN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Updated InstructionItem to accept fontSize as a parameter
class InstructionItem extends StatelessWidget {
  final String text;
  final double fontSize;

  const InstructionItem({
    super.key,
    required this.text,
    this.fontSize = 16, // Default font size
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '•',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize, // Dynamic font size
              color: const Color(0xFF000000),
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
