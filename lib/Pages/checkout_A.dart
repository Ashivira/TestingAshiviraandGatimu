import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          
          const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                ProductCard(),
                ProductCard(),
              ],
            ),
          ),

   
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Checkout",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const Divider(),

              
                  const CheckoutOptionRow(title: "Delivery", value: "Select Method"),
                  
                 
                  CheckoutOptionRow(
                    title: "Payment",
                    value: "",
                    trailing: Switch(
                      value: true,
                      onChanged: (bool value) {},
                      activeColor: Colors.black,
                    ),
                  ),

             
                  const CheckoutOptionRow(title: "Promo Code", value: "Pick discount"),

        
                  const CheckoutOptionRow(
                    title: "Total Cost",
                    value: "\$00.00",
                    isBold: true,
                  ),

                  const SizedBox(height: 10),

        
                  const Center(
                    child: Text(
                      "By placing an order you agree to our \nTerms And Conditions.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 10),


                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "PLACE ORDER",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
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


class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.image, color: Colors.grey),
        ),
        title: const Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text("Product Brand Name"),
        trailing: const Text("\$0.00", style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {},
      ),
    );
  }
}


class CheckoutOptionRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final Widget? trailing;

  const CheckoutOptionRow({
    super.key,
    required this.title,
    required this.value,
    this.isBold = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          trailing ??
              Row(
                children: [
                  Text(
                    value,
                    style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
        ],
      ),
    );
  }
}
