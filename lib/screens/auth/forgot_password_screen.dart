import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Center(child: Placeholder(fallbackHeight: 160)), // الصورة
              SizedBox(height: 30),
              Text('نسيت كلمة السر',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('أدخل عنوان البريد الإلكتروني المستخدم عند التسجيل'),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'البريد الإلكتروني أو رقم الهاتف',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () => Navigator.pushNamed(context, '/verify'),
                child: Text('أرسل الرابط'),
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('هل تواجه مشكلة؟ أرسل مرة أخرى'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
