import 'package:flutter/material.dart';
import 'package:wardrobepages/Pages/my_details_page.dart';
import 'package:wardrobepages/Pages/recommended_stores_page.dart';
// import 'package:wardrobepages/Pages/scanning_history_page.dart';
import 'package:wardrobepages/Pages/scanning_instructions_screen.dart';
// import 'package:wardrobepages/Pages/welcome_page.dart';
import 'package:wardrobepages/utilities/drawer_data.dart';

// import 'home_page.dart';

void main() {
  runApp(const QuickScanAccessA());
}

class QuickScanAccessA extends StatelessWidget {
  const QuickScanAccessA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFFFE4E1),
      ),
      home: const MeasurementScreen(),
    );
  }
}

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({super.key});

  @override
  _MeasurementScreenState createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  // Stores measurement values in a map
  final Map<String, String> _measurements = {
    'Shirt Size': 'L',
    'Pants Size': '34',
    'Jacket Size': '42R',
    'Chest': '42"',
    'Waist': '34"',
    'Hips': '40"',
    'Inseam': '32"',
    'Shoulders': '18.5"',
    'Neck': '16"',
  };

  @override
  void initState() {
    super.initState();
  }

  // Function to update a measurement
  void _editMeasurement(String key) {
    TextEditingController controller =
        TextEditingController(text: _measurements[key]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit $key"),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("CANCEL"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _measurements[key] = controller.text;
                });
                Navigator.pop(context);
              },
              child: const Text("SAVE"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: const Color(0xFFFFE4E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE4E1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RecommendedStoresPage()),
              (route) => false, // Clears the navigation stack
            );
          },
          icon: Image.asset('assets/logo.png', height: 40),
          padding: EdgeInsets.zero, // Removes extra padding around the icon
          constraints:
              const BoxConstraints(), // Prevents unnecessary space usage
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
                MaterialPageRoute(builder: (context) => const MyDetailsPage()),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back, Joe!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Quick Scan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Get your perfect fit in minutes',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScanningInstructionsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2B3C),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'START NEW SCAN',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // TODO: Add functionality to open camera
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA1B2C3),
                  minimumSize: const Size(double.infinity, 53),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'UPDATE LAST SCAN',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Measurements',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share, size: 20),
                        onPressed: () {
                          // TODO: Add functionality to share details
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.download, size: 20),
                        onPressed: () {
                          // TODO: Add functionality to download details
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: _measurements.keys
                      .map((key) =>
                          _buildMeasurementTile(key, _measurements[key]!))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for measurement tile with edit icon
  Widget _buildMeasurementTile(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.black, size: 18),
              onPressed: () => _editMeasurement(label),
            ),
          ),
        ],
      ),
    );
  }
}
