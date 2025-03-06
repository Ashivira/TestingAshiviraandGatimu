import 'package:flutter/material.dart';

class SavedMeasurementsPage extends StatelessWidget {
  const SavedMeasurementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("These are my saved measurements."),
      ),
    );
  }
}
