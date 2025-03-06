import 'package:flutter/material.dart';
import 'package:wardrobepages/utilities/drawer_data.dart';

class RecommendedStoresPage2 extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Jacket', 'price': '\$0.00', 'image': 'assets/jacket.png'},
    {'name': 'Shirt', 'price': '\$0.00', 'image': 'assets/shirt.png'},
    {'name': 'T-Shirt', 'price': '\$0.00', 'image': 'assets/tshirt.png'},
    {'name': 'Sweater', 'price': '\$0.00', 'image': 'assets/sweater.png'},
  ];

  RecommendedStoresPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // ------------------ A P P  B A R --------------------------
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(
              "assets/logo.png",
              //height: 100,
              //width: 100,
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shop_2)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ))),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.black, // Underline color
            labelColor: Colors.black, // Selected tab color
            unselectedLabelColor: Colors.grey, // Unselected tab color
            tabs: [
              Tab(text: "Popular"),
              Tab(text: "Men"),
              Tab(text: "Women"),
              Tab(text: "Sale"),
            ],
          ),
        ),

        // -------------------- P A G E  B O D Y --------------------------
        drawer: MyDrawer(),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recommended for you, Joe",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        "FILTER",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(), // Pushes the filter icon to the right
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.filter)),
                    ],
                  ),

                  const SizedBox(height: 10), // Adds spacing below the title

                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 columns
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio:
                            0.75, // Adjusted to fit product details properly
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image Section with Heart Icon
                              Expanded(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                      child: Image.asset(
                                        products[index]['image']!,
                                        fit: BoxFit
                                            .cover, // Ensure image covers full area
                                        width: double
                                            .infinity, // Stretches image to card width
                                        height: double
                                            .infinity, // Stretches image to card height
                                      ),
                                    ),
                                    // Heart Icon Positioned on Top Right
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: IconButton(
                                        onPressed: () {
                                          // TODO: Handle like action
                                        },
                                        icon: const Icon(Icons.favorite_border),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Product Details Section with Grey Background
                              Container(
                                width: double
                                    .infinity, // Makes the container stretch fully
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[
                                      300], // Matches background color of image section
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(12)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index]['name']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(products[index]['price']!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Center(child: Text("Men Section")),
            const Center(child: Text("Women Section")),
            const Center(child: Text("Sale Section")),
          ],

          /*
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommended for you, Joe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 10), // Adds spacing below the title

                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                child: Image.asset(
                                  products[index]['image']!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index]['name']!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(products[index]['price']!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          */
        ),
      ),
    );
  }
}
