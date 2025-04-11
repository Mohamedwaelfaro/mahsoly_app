import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08,
            vertical: screenHeight * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Image.asset(
                "imgs/Login Illustration.png",
                height: screenHeight * 0.3,
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.03),
              const Text(
                "أهلا بك في محصولي",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildTextField(
                "البريد الإلكتروني أو رقم الهاتف",
                Icons.email,
                false,
              ),
              SizedBox(height: screenHeight * 0.015),
              _buildTextField("كلمة السر", Icons.lock, true),
              SizedBox(height: screenHeight * 0.01),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "نسيت كلمة السر؟",
                    style: TextStyle(
                      fontFamily: "Cairo",
                      color: Colors.green,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ليس لديك حساب؟",
                    style: TextStyle(fontFamily: "Cairo"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "إنشاء حساب جديد",
                      style: TextStyle(
                        fontFamily: "Cairo",
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      textAlign: TextAlign.right,
      style: const TextStyle(fontFamily: "Cairo"),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontFamily: "Cairo"),
        prefixIcon: Icon(icon, color: Colors.green),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
