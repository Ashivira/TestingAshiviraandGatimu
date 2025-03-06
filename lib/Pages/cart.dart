import 'package:flutter/material.dart';
import 'package:wardrobepages/utilities/drawer_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      "image": "assets/jacket.png",
      "name": "Brown Jacket",
      "brand": "Brand A",
      "price": 0.00,
      "quantity": 1
    },
    {
      "image": "assets/shirt.png",
      "name": "Brown Shirt",
      "brand": "Brand B",
      "price": 0.00,
      "quantity": 1
    },
    {
      "image": "assets/tshirt.png",
      "name": "Black T-Shirt",
      "brand": "Brand C",
      "price": 0.00,
      "quantity": 1
    },
    {
      "image": "assets/sweater.png",
      "name": "Yellow Sweater",
      "brand": "Brand D",
      "price": 0.00,
      "quantity": 1
    },
  ];

  double get totalPrice {
    return cartItems.fold(
        0, (sum, item) => sum + (item["price"] * item["quantity"]));
  }

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]["quantity"]++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]["quantity"] > 1) {
        cartItems[index]["quantity"]--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffD0D0D0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: Image.asset(
                        item["image"]!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        item["name"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item["brand"]!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () => decreaseQuantity(index),
                          ),
                          Text(
                            "${item["quantity"]}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () => increaseQuantity(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.red),
                            onPressed: () => removeItem(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "GO TO CHECKOUT",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "\$${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
