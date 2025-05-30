import 'package:flutter/material.dart';
import 'package:mahsoly_app1/screens/home/Farmer/widgets/farmer_app_bar.dart';
import 'package:mahsoly_app1/screens/home/Farmer/widgets/feature_card.dart';

class FarmerHomeContent extends StatelessWidget {
  const FarmerHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = MediaQuery.of(context).textScaleFactor;
    final sh = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> featureCardData = [
      {
        'title': 'إضافة محصول جديد',
        'imagePath': 'imgs/Rectangle 51.png',
        'onTap': () {},
      },
      {
        'title': 'إدارة المحاصيل',
        'imagePath': 'imgs/Rectangle 53.png',
        'onTap': () {},
      },
      {
        'title': 'الطلبات الواردة',
        'imagePath': 'imgs/Rectangle 49.png',
        'onTap': () {},
      },
      {
        'title': 'إحصائيات وتقارير',
        'imagePath': 'imgs/Rectangle 47.png',
        'onTap': () {},
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const FarmerAppBar(),
            const SizedBox(height: 20),
            Center(
              child: Text(
                '"نحن هنا لمساعدتك في تسويق منتجاتك بأفضل طريقة"',
                style: TextStyle(
                  fontSize: 15 * ts,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: sh * 0.025),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: featureCardData.length,
                itemBuilder: (context, index) {
                  final item = featureCardData[index];
                  return FeatureCard(
                    title: item['title'],
                    imagePath: item['imagePath'],
                    onTap: item['onTap'],
                    ts: ts,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
