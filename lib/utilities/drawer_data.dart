import 'package:flutter/material.dart';
import 'package:wardrobepages/Pages/payment_methods.dart';
import 'package:wardrobepages/Pages/size_guide.dart';
import 'package:wardrobepages/pages/recommended_stores_page.dart';
import '../pages/about_page.dart';
import '../pages/cart.dart';
import '../pages/help_page.dart';
import '../pages/my_details_page.dart';
import '../pages/notifications_page.dart';
import '../pages/saved_measurements_page.dart';
import '../pages/wishlist.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: const Color(0xFF0E1A2B), // Dark background color
          child: Column(
            children: [
              // Profile Section
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF0E1A2B),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white10,
                      child: Icon(Icons.person, size: 30, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Joe Brown",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "joebrown@gmail.com",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Menu Items (Scrollable)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _drawerItem(
                          icon: Icons.home,
                          text: "Home",
                          context: context,
                          destination: RecommendedStoresPage()),
                      _drawerItem(
                          icon: Icons.notifications,
                          text: "Notifications",
                          context: context,
                          destination: const NotificationsPage()),
                      _drawerItem(
                          icon: Icons.shopping_bag,
                          text: "Cart",
                          context: context,
                          destination: const CartPage()),
                      _drawerItem(
                          icon: Icons.favorite,
                          text: "Wishlist",
                          context: context,
                          destination: WishlistPage()),
                      _drawerItem(
                          icon: Icons.pin_drop,
                          text: "Saved Measurements",
                          context: context,
                          destination: const SavedMeasurementsPage()),
                      _drawerItem(
                          icon: Icons.payment,
                          text: "Payment Methods",
                          context: context,
                          destination: PaymentMethodsPage()),
                      _drawerItem(
                          icon: Icons.person,
                          text: "My Profile",
                          context: context,
                          destination: MyDetailsPage()),
                      _drawerItem(
                          icon: Icons.developer_board,
                          text: "Size Guide",
                          context: context,
                          destination: SizeGuideScreen()),
                      _drawerItem(
                          icon: Icons.help,
                          text: "Help",
                          context: context,
                          destination: const HelpPage()),
                      _drawerItem(
                          icon: Icons.info,
                          text: "About",
                          context: context,
                          destination: const AboutPage()),
                    ],
                  ),
                ),
              ),

              // Logout Button (Always at Bottom)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    // TODO: Implement logout functionality
                  },
                  
                  child: const Text(
                    "LOG OUT",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String text,
    required BuildContext context,
    required Widget destination,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => destination));
      },
    );
  }
}
