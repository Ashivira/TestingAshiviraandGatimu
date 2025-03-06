import 'package:flutter/material.dart';

class SizeGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Size Guide'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Size Guide',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Measurement Instructions',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Image.asset(
                'assets/measurement_chart.png',
                height: 150,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '- Chest: Measure around the fullest part of your chest.\n'
              '- Waist: Measure at the narrowest part of your waistline.\n'
              '- Hips: Measure around the widest part of your hips.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Size Chart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Table(
              border: TableBorder.all(color: Colors.white),
              children: [
                _tableRow(['UNISEX', 'WOMEN', 'MEN'], isHeader: true),
                _tableRow(['XS', '0-4', '30-32']),
                _tableRow(['S', '6-8', '34-36']),
                _tableRow(['M', '10-12', '38-40']),
                _tableRow(['L', '12-14', '42-44']),
                _tableRow(['XL', '16-18', '46-48']),
                _tableRow(['XXL', '20-22', '50-52']),
                _tableRow(['XXXL', '24-26', '54-56']),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'STILL NOT SURE? CONTACT CUSTOMER SUPPORT.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _tableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells
          .map(
            (cell) => Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                cell,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
          .toList(),
    );
  }
}
