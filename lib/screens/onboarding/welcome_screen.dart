import 'package:flutter/material.dart';
import 'package:flutter_auth_app/screens/auth/login_screen.dart';
import 'package:flutter_auth_app/screens/auth/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.agriculture, size: 100, color: Colors.green),
              SizedBox(height: 24),
              Text('هل لديك حساب بالفعل؟',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen())),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.green),
                child: Text('نعم، تسجيل الدخول'),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignupScreen())),
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50)),
                child: Text('لا، إنشاء حساب جديد'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
