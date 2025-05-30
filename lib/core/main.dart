// import 'package:flutter/material.dart';
// import 'package:flutter_auth_app/screens/auth/login_screen.dart';
// import 'package:flutter_auth_app/screens/auth/signup_screen.dart';
// import 'package:flutter_auth_app/screens/onboarding/splash_screen.dart';
// import 'package:flutter_auth_app/screens/onboarding/welcome_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // نحفظ نوع المستخدم مؤقتًا لو مش محفوظ
//   final prefs = await SharedPreferences.getInstance();
//   if (!prefs.containsKey('userType')) {
//     await prefs.setString('userType', 'farmer'); // أو 'user'
//   }

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'محصولي',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.green),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => SplashScreen(),
//         '/welcome': (context) => WelcomeScreen(),
//         '/login': (context) => LoginScreen(),
//         '/signup': (context) => SignupScreen(),
//       },
//     );
//   }
//}
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/screens/profile/add_product_screen.dart';
import 'package:flutter_auth_app/screens/profile/edit_profile_screen.dart';
import 'package:flutter_auth_app/screens/profile/profile_screen.dart';

void main() {
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
        '/': (context) => ProfileScreen(), // ابدأ بصفحة الملف الشخصي مؤقتًا
        '/edit-profile': (context) => EditProfileScreen(),
        '/add-product': (context) => AddProductScreen(),
      },
    );
  }
}
