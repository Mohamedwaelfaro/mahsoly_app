import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

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
              Text('إرسال رمز التحقق',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (val) {},
                onCompleted: (val) {
                  Navigator.pushNamed(context, '/new_password');
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeColor: Colors.green,
                  selectedColor: Colors.green.shade200,
                  inactiveColor: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/new_password');
                },
                child: Text('التحقق من الرمز'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
