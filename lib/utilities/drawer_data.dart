import 'package:flutter/material.dart';
import 'package:wardrobepages/Pages/about_page.dart';
import 'package:wardrobepages/Pages/cart.dart';
import 'package:wardrobepages/Pages/help_page.dart';
import 'package:wardrobepages/Pages/my_details_page.dart';
import 'package:wardrobepages/Pages/notifications_page.dart';
import 'package:wardrobepages/Pages/paymentmethods.dart';
import 'package:wardrobepages/Pages/saved_measurements_page.dart';
import 'package:wardrobepages/Pages/wishlist.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: const Color(0xFF0E1A2B), // Dark background color
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    //Icon(Icons.edit, color: Colors.grey, size: 18),
                  ],
                ),
              ),

              // Menu Items
              const SizedBox(
                height: 20,
              ),
              _drawerItem(
                  // Button to go to Notifications Page from Drawer
                  icon: Icons.notifications,
                  text: "Notifications",
                  context: context,
                  destination: const NotificationsPage()),
              const SizedBox(
                height: 20,
              ),
              _drawerItem(
                  // Button to go to Cart from Drawer
                  icon: Icons.shopping_bag,
                  text: "Cart",
                  context: context,
                  destination: const CartPage()),
              const SizedBox(
                height: 20,
              ),
              _drawerItem(
                  // Button to go to Wishlist from Drawer
                  icon: Icons.favorite,
                  text: "Wishlist",
                  context: context,
                  destination: WishlistPage()),
              const SizedBox(
                height: 20,
              ),

              _drawerItem(
                  // Button to go to Saved Measurements from Drawer
                  icon: Icons.pin_drop,
                  text: "Saved Measurements",
                  context: context,
                  destination: const SavedMeasurementsPage()),
              const SizedBox(
                height: 20,
              ),
              _drawerItem(
                  // Button to go to Payment Methods from Drawer
                  icon: Icons.payment,
                  text: "Payment Methods",
                  context: context,
                  destination: PaymentMethodsPage()),
              const SizedBox(
                height: 20,
              ),
              _drawerItem(
                  // Button to go to Profile from Drawer
                  icon: Icons.person,
                  text: "My Profile",
                  context: context,
                  destination: const MyDetailsPage()),

              const SizedBox(
                height: 20,
              ),
              _drawerItem(
                  // Button to go to Help Page from Drawer
                  icon: Icons.help,
                  text: "Help",
                  context: context,
                  destination: const HelpPage()),
              const SizedBox(
                height: 20,
              ),
              _drawerItem(
                  // Button to go to About Page from Drawer
                  icon: Icons.info,
                  text: "About",
                  context: context,
                  destination: const AboutPage()),

              const Spacer(),

              // Logout Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  // TODO: Add logout functionality
                  //onTap: () => _logout(context), // Call logout method on tap
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
