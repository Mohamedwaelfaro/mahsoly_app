import 'package:flutter/material.dart';
import 'package:mahsoly_app1/screens/home/Trader/trader_content.dart';

import 'add_product.dart';
import 'cart_screen.dart';
import 'favourite_screen.dart';
import '../../profile/profile_screen.dart';

class TraderScreen extends StatefulWidget {
  const TraderScreen({super.key});

  @override
  State<TraderScreen> createState() => _TraderScreenState();
}

class _TraderScreenState extends State<TraderScreen> {
  int _selectedIndex = 3;

  final List<Widget> _screens = [
    FavouriteScreen(),
    const AddProductScreen(),
    const ProfileScreen(),
    const HomeContent(),
    CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), // قلب
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), // علامة الجمع
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), // شخص
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // بيت
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), // عربة تسوق
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

// بقية الكود الخاص بـ HomeContent و الصفحات الأخرى (FavouriteScreen, AddProductScreen, etc.) يبقى كما هو
