import 'package:flutter/material.dart';
import 'package:wardrobepages/utilities/drawer_data.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        elevation: 0,
        centerTitle: true,
        title: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.account_balance_wallet, color: Colors.white),
        ),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Payment Methods",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Center(child: Image.asset('assets/mpesa.png', height: 30)),
            const SizedBox(height: 10),
            const Text("Enter Your Phone No."),
            const TextField(decoration: InputDecoration(hintText: "07XXXX")),
            const SizedBox(height: 10),
            Center(child: Image.asset('assets/paypal.png', height: 30)),
            const SizedBox(height: 10),
            const Text("Enter Your Email"),
            const TextField(
                decoration:
                    InputDecoration(hintText: "Laillyfa@Examplemail.com")),
            const SizedBox(height: 10),
            const Text("Card Number"),
            const TextField(
                decoration:
                    InputDecoration(hintText: "1231 – 2312 – 3123 – 1231")),
            const SizedBox(height: 10),
            const Row(
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
            const SizedBox(height: 10),
            const Text("Card Holder Name"),
            const TextField(
                decoration: InputDecoration(hintText: "Laillyfa Febrina")),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Payment method saved successfully!"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text("REGISTER", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
