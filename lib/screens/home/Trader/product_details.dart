import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String price;
  final String type;
  final String seller;
  final String date;

  const ProductDetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.type,
    required this.seller,
    required this.date,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 5;
  bool isFavorite = false;
  int _selectedIndex = 3; // لتحديد العنصر النشط في شريط التنقل

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  String _formatQuantity(int quantity) {
    return quantity.toString().padLeft(2, '0');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // هنا يمكنك إضافة منطق الانتقال إلى الصفحات الأخرى
      // بناءً على قيمة index
      if (index == 0) {
        // الانتقال إلى صفحة المفضلة
      } else if (index == 1) {
        // الانتقال إلى صفحة إضافة منتج
      } else if (index == 2) {
        // الانتقال إلى صفحة الملف الشخصي
      } else if (index == 3) {
        // لا تفعل شيء لأننا بالفعل في صفحة التفاصيل (أو يمكنك العودة إلى الرئيسية)
      } else if (index == 4) {
        // الانتقال إلى صفحة عربة التسوق
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.black),
                onPressed: () {
                  Share.share(
                    '${widget.name}\n${widget.description}\nالسعر: ${widget.price} جنيه',
                  );
                },
              ),
              const Text(
                'تفاصيل المحصول',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.image,
                  height: screenHeight * 0.22,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                widget.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24 * textScale,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              buildDetailRow('الوصف', widget.description, textScale: textScale),
              buildDivider(),
              buildQuantityRow(textScale: textScale),
              buildDivider(),
              buildDetailRow(
                'السعر',
                '${widget.price} جنيه',
                textScale: textScale,
              ),
              buildDivider(),
              buildDetailRow('النوع', widget.type, textScale: textScale),
              buildDivider(),
              buildDetailRowWithIcon(
                'المعلن',
                widget.seller,
                Icons.person_outline,
                textScale: textScale,
              ),
              buildDivider(),
              buildDetailRow(
                'تاريخ الاعلان',
                widget.date,
                valueColor: Colors.green,
                textScale: textScale,
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isFavorite
                                  ? 'تمت الإضافة إلى المفضلة'
                                  : 'تمت الإزالة من المفضلة',
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 28,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تمت إضافة المنتج إلى العربة'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.018,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'أضف للعربة',
                        style: TextStyle(
                          fontSize: 18 * textScale,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _onItemTapped(index);
            // TODO: Implement navigation to other pages based on index
            // Example: Navigator.pushNamed(context, '/favorites');
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDivider() =>
      const Divider(height: 24, thickness: 1, color: Color(0xFFE0E0E0));

  Widget buildDetailRow(
    String title,
    String value, {
    Color valueColor = Colors.black,
    double textScale = 1.0,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 16 * textScale,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(color: valueColor, fontSize: 16 * textScale),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailRowWithIcon(
    String title,
    String value,
    IconData icon, {
    double textScale = 1.0,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 16 * textScale,
            ),
          ),
          Row(
            children: [
              Text(value, style: TextStyle(fontSize: 16 * textScale)),
              const SizedBox(width: 6),
              Icon(icon, size: 20 * textScale, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildQuantityRow({double textScale = 1.0}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'الكمية',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontSize: 16,
          ),
        ),
        Container(
          width: 110,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: quantity > 1 ? _decrementQuantity : null,
                iconSize: 22 * textScale,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _formatQuantity(quantity),
                    style: TextStyle(fontSize: 16 * textScale),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_drop_up),
                onPressed: _incrementQuantity,
                iconSize: 22 * textScale,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
