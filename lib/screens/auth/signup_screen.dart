import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String? selectedRole;

  final List<String> roles = ['مزارع', 'تاجر', 'شركة شحن', 'مفتش جودة'];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(height: 160, child: Placeholder()),
              const SizedBox(height: 20),
              Text('أهلاً بك في محصولي', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              buildField('الاسم كامل', nameController),
              buildField('البريد الإلكتروني', emailController),
              buildField('رقم الهاتف', phoneController),
              buildField('كلمة السر', passwordController, obscure: true),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: Text('هل أنت؟', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: roles.map((role) {
                  return ChoiceChip(
                    label: Text(role),
                    selected: selectedRole == role,
                    onSelected: (_) {
                      setState(() {
                        selectedRole = role;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  if (selectedRole == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('برجاء اختيار الدور أولاً')),
                    );
                    return;
                  }
                },
                child: Text('إنشاء حساب'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: Text('لديك حساب بالفعل؟ تسجيل الدخول', style: TextStyle(color: Colors.green)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(String label, TextEditingController controller, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}