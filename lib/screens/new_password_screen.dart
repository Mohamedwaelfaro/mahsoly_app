import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Center(child: Placeholder(fallbackHeight: 160)), // الصورة
              SizedBox(height: 30),
              Text('كلمة السر الجديدة',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'ادخل كلمة السر الجديدة',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'تأكيد كلمة السر الجديدة',
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
                onPressed: () => Navigator.pushNamed(context, '/success'),
                child: Text('إنشاء كلمة سر جديدة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
