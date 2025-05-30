import 'package:flutter/material.dart';

import '../../../payment/payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'ارز ابيض',
      'price': 15000,
      'qty': 1.5,
      'image': 'imgs/أفضل_أنواع_الأرز 1.png',
    },
    {
      'name': 'عنب احمر',
      'price': 10000,
      'qty': 1,
      'image': 'imgs/tbl_articles_article_17762_957 1.png',
    },
    {
      'name': 'بذور الكتان',
      'price': 7000,
      'qty': 1,
      'image': 'imgs/Doc-P-404720-637739669259010811 1.png',
    },
    {
      'name': 'طماطم',
      'price': 10000,
      'qty': 1,
      'image': 'imgs/Group 17587.png',
    },
  ];

  void increaseQty(int index) {
    setState(() {
      cartItems[index]['qty'] += 1;
    });
  }

  void decreaseQty(int index) {
    setState(() {
      if (cartItems[index]['qty'] > 1) {
        cartItems[index]['qty'] -= 1;
      }
    });
  }

  void removeItem(int index) async {
    final removedItem = cartItems[index];
    bool confirm = await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('تأكيد الحذف'),
            content: Text('هل أنت متأكد أنك تريد حذف ${removedItem['name']}؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('إلغاء'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('حذف', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );

    if (confirm == true) {
      setState(() {
        cartItems.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم حذف ${removedItem['name']} من السلة'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(
      0,
      (sum, item) => sum + item['price'] * item['qty'],
    );
    double delivery = 2500;
    final sh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          _buildHeader(context, sh),
          Padding(
            padding: EdgeInsets.only(top: sh * 0.23),
            child: Column(
              children: [
                Expanded(child: _buildCartList()),
                _buildTotalSection(total, delivery),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double sh) {
    return Stack(
      children: [
        Container(
          height: sh * 0.28,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('imgs/istockphoto-1221724425-612x612 1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green.withOpacity(0.7),
                  Colors.green.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: sh * 0.18,
          left: 0,
          right: 0,
          child: Container(
            height: sh * 0.13,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
          ),
        ),
        Positioned(
          top: sh * 0.11,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'عربة التسوق',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black45,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item['image'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'طن',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'كيلو جرام',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => decreaseQty(index),
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                    Text('${item['qty']}'),
                    IconButton(
                      onPressed: () => increaseQty(index),
                      icon: Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${item['price']} ج.م',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeItem(index),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTotalSection(double total, double delivery) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الاجمالي :', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('$total ج.م'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('التوصيل :', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('$delivery ج.م'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'اجمالي الفاتورة :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${total + delivery} ج.م',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),

          ElevatedButton(
            onPressed:
                cartItems.isEmpty
                    ? null
                    : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ),
                      );
                    },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'ادفع الان',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
