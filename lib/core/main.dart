import 'package:flutter/material.dart';
import 'package:flutter_auth_app/screens/auth/login_screen.dart';
import 'package:flutter_auth_app/screens/auth/signup_screen.dart';
import 'package:flutter_auth_app/screens/splash_screen.dart';
import 'package:flutter_auth_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // نحفظ نوع المستخدم مؤقتًا لو مش محفوظ
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey('userType')) {
    await prefs.setString('userType', 'farmer'); // أو 'user'
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'محصولي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
