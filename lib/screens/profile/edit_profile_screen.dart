import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  final nameController = TextEditingController(text: 'احمد محمد');
  final emailController = TextEditingController(text: 'ahmedmohamed@gmail.com');
  final phoneController = TextEditingController(text: '01169754357');
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('تغيير الصورة')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.png')),
              SizedBox(height: 10),
              Text("تغيير الصورة"),
              SizedBox(height: 20),
              buildInput("اسم المستخدم", nameController),
              buildInput("البريد الإلكتروني", emailController),
              buildInput("رقم الهاتف", phoneController),
              buildInput("العنوان", addressController),
              buildInput("كلمة السر", passwordController, isPassword: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.green),
                child: Text("تحديث"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
