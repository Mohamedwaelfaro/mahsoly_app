import 'package:flutter/material.dart';
import 'package:mahsoly_app1/screens/auth/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: Image.asset('imgs/Login Illustration.png'),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'أهلاً بك في محصولي',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    buildField(
                      'الاسم كامل',
                      nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل اسمك الكامل';
                        }
                        return null;
                      },
                    ),
                    buildField(
                      'البريد الإلكتروني',
                      emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل بريدك الإلكتروني';
                        } else if (!value.contains('@')) {
                          return 'بريد إلكتروني غير صالح';
                        }
                        return null;
                      },
                    ),
                    buildField(
                      'رقم الهاتف',
                      phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل رقم الهاتف';
                        } else if (value.length < 10) {
                          return 'رقم الهاتف غير صحيح';
                        }
                        return null;
                      },
                    ),
                    buildField(
                      'كلمة السر',
                      passwordController,
                      obscure: true,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'كلمة السر يجب أن تكون 6 أحرف أو أكثر';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text('هل أنت؟', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          roles.map((role) {
                            return ChoiceChip(
                              label: Text(role),
                              selected: selectedRole == role,
                              selectedColor: Colors.green.shade700,
                              backgroundColor: Colors.grey.shade200,
                              labelStyle: TextStyle(
                                color:
                                    selectedRole == role
                                        ? Colors.white
                                        : Colors.black87,
                              ),
                              onSelected: (_) {
                                setState(() {
                                  selectedRole = role;
                                });
                              },
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (selectedRole == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('برجاء اختيار الدور أولاً'),
                              ),
                            );
                          } else {
                            // هنا ممكن تكمّل التسجيل أو التنقل حسب الدور
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
                            );
                          }
                        }
                      },
                      child: const Text(
                        'إنشاء حساب',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'لديك حساب بالفعل؟ تسجيل الدخول',
                          style: TextStyle(color: Colors.green.shade700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildField(
    String label,
    TextEditingController controller, {
    bool obscure = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
