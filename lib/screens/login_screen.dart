import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // صورة بالأعلى
              SizedBox(
                height: 160,
                child: Placeholder(), // هنا تحط الصورة اللي فوق
              ),
              const SizedBox(height: 20),
              const Text(
                'أهلاً بك في محصولي',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              // حقل البريد الإلكتروني
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'البريد الإلكتروني',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'البريد الإلكتروني أو رقم الهاتف',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              // حقل كلمة السر
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'كلمة السر',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'كلمة السر',
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              // رابط نسيت كلمة السر
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // حط التنقل لنسيت كلمة السر هنا
                  },
                  child: Text('نسيت كلمة السر؟',
                      style: TextStyle(color: Colors.green)),
                ),
              ),
              const SizedBox(height: 10),
              // زر تسجيل الدخول
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    // عملية تسجيل الدخول
                  },
                  child: const Text('تسجيل الدخول',
                      style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 15),
              // رابط إنشاء حساب
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text('ليس لديك حساب؟ إنشاء حساب جديد',
                    style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
