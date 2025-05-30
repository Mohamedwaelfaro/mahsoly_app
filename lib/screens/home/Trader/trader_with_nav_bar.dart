import 'package:flutter/material.dart';
import 'package:mahsoly_app1/screens/home/Trader/notification_screen.dart';
import 'trader_screen.dart';

class HomeWithNavBar extends StatefulWidget {
  const HomeWithNavBar({super.key});

  @override
  State<HomeWithNavBar> createState() => _HomeWithNavBarState();
}

class _HomeWithNavBarState extends State<HomeWithNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    TraderScreen(),
    Placeholder(), // السلة
    Placeholder(), // إضافة
    NotificationScreen(),
    Placeholder(), // الحساب
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
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'السلة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'إضافة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: 'الإشعارات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}
