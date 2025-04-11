import 'package:flutter/material.dart';
import 'home_user_screen.dart';
import 'home_farmer_screen.dart';

class MainHomeScreen extends StatelessWidget {
  final String userType; // 'user' أو 'farmer'

  const MainHomeScreen({required this.userType});

  @override
  Widget build(BuildContext context) {
    return userType == 'farmer' ? HomeFarmerScreen() : HomeUserScreen();
  }
}
