import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'حبوب',
      'items': ['أرز أبيض', 'بذور الكتان', 'بذور الشيا']
    },
    {
      'title': 'خضروات',
      'items': ['بصل أحمر', 'بطاطس', 'طماطم']
    },
    {
      'title': 'فاكهة',
      'items': ['بطيخ', 'برتقال', 'عنب أحمر']
    },
    {
      'title': 'الألياف',
      'items': ['قطن', 'قصب السكر']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade400, Colors.green.shade700],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.green),
                      radius: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'مرحباً بك في محصولي',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildDrawerItem(
                      icon: Icons.login,
                      text: 'تسجيل الدخول',
                      onTap: () => Navigator.pushNamed(context, '/login'),
                    ),
                    _buildDrawerItem(
                      icon: Icons.person_add,
                      text: 'إنشاء حساب',
                      onTap: () => Navigator.pushNamed(context, '/signup'),
                    ),
                    const Divider(),
                    _buildDrawerItem(
                      icon: Icons.settings,
                      text: 'الإعدادات',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('محصولي',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.green),
                  Text('مصر', style: TextStyle(color: Colors.black)),
                ],
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن منتجاتك',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...categories.map((cat) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cat['title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {},
                        child: const Text('عرض المزيد',
                            style: TextStyle(color: Colors.green)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cat['items'].length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: 140,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 3)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: double.infinity,
                                child:
                                    const Placeholder(), // ضع صورة المنتج هنا
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(cat['items'][index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ),
                              const Text('تفاصيل المنتج',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  static Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(text),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
    );
  }
}
