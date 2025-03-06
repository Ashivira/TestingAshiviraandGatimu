import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        elevation: 0,
        centerTitle: true,
        title: CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.account_balance_wallet, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Payment Methods",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Center(child: Image.asset('assets/mpesa.png', height: 30)),
            SizedBox(height: 10),
            Text("Enter Your Phone No."),
            TextField(decoration: InputDecoration(hintText: "07XXXX")),
            SizedBox(height: 10),
            Center(child: Image.asset('assets/paypal.png', height: 30)),
            SizedBox(height: 10),
            Text("Enter Your Email"),
            TextField(
                decoration:
                    InputDecoration(hintText: "Laillyfa@Examplemail.com")),
            SizedBox(height: 10),
            Text("Card Number"),
            TextField(
                decoration:
                    InputDecoration(hintText: "1231 – 2312 – 3123 – 1231")),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expiration Date"),
                      TextField(
                          decoration: InputDecoration(hintText: "12/12/20XX")),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Security Code"),
                      TextField(
                          decoration: InputDecoration(hintText: "1219XXX")),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("Card Holder Name"),
            TextField(
                decoration: InputDecoration(hintText: "Laillyfa Febrina")),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Payment method saved successfully!"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text("REGISTER", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
