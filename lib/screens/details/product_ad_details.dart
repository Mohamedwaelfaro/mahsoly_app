import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String price;

  const ProductDetailsScreen({required this.productName, required this.price});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedQty = '05';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('تفاصيل المنتج'),
          actions: [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () {
                  // أضف للعربة
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text('أضف للعربة'),
              ),
            ),
            BottomNavigationBar(
              currentIndex: 2,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle_outline), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: ''),
              ],
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/placeholder.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(widget.productName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            buildRow('الوصف', widget.productName),
            buildQtySelector(),
            buildRow('السعر', '${widget.price} جنيه'),
            buildRow('النوع', 'حبوب'),
            buildRow('المُعلن', 'عادل محمد'),
            buildRow('تاريخ الإعلان', '28 نوفمبر 2024'),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(title,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }

  Widget buildQtySelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text('الكمية',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold))),
          Expanded(
            flex: 3,
            child: DropdownButtonFormField<String>(
              value: selectedQty,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              items: ['01', '02', '03', '04', '05', '10'].map((qty) {
                return DropdownMenuItem(value: qty, child: Text(qty));
              }).toList(),
              onChanged: (value) => setState(() => selectedQty = value!),
            ),
          ),
        ],
      ),
    );
  }
}
