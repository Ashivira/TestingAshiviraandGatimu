import 'package:flutter/material.dart';
import 'package:wardrobepages/Pages/editdetails.dart';
import 'package:wardrobepages/Pages/home_page.dart';
// import 'package:wardrobepages/Pages/size_guide.dart';
// import 'package:wardrobepages/Pages/my_details_page.dart';
// import 'package:wardrobepages/Pages/paymentmethods.dart' show PaymentMethodsPage;
// import 'package:wardrobepages/Pages/oldpaymentmethods.dart';
// import 'package:wardrobepages/Pages/about_page.dart';
// import 'package:wardrobepages/Pages/cart.dart';
// import 'package:wardrobepages/Pages/checkout_A.dart';
// import 'package:wardrobepages/Pages/checkout_B.dart';
// import 'package:wardrobepages/Pages/order_confirmed.dart';
// import 'package:wardrobepages/Pages/order_failed.dart';
// import 'package:wardrobepages/Pages/recommended_stores.dart';
// import 'package:wardrobepages/Pages/scanning_instructions_screen.dart';
// import 'package:wardrobepages/Pages/wishlist.dart';
// import 'Pages/help_page.dart';
// import 'Pages/quick_scan_access_A.dart';
// import 'Pages/recommended_stores_page.dart';
// import 'Pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      // home: WishlistPage(),
      //home: RecommendedStoresPage(),
      // home: HelpPage(),
      // home: AboutPage(),
      // home: WelcomePage(),
      // home: const QuickScanAccessA(),
      // home: ScanningInstructionsScreen(),
      // home: const SuccessPage(),
      // home: const CartPage(),
      // home: const FailedPage(),
      // home: const CartPage(),
      // home: const CheckoutPage(),
      // home: const CardCheckoutPage(),
      // home: PaymentMethodsPage(),
      // home: MyDetailsPage()
      // home: SizeGuideScreen(),
      // home: EditDetailsPage(),
      home: HomePage(),
    );
  }
}
