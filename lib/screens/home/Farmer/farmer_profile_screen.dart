import 'package:flutter/material.dart';
import 'package:mahsoly_app1/screens/home/Farmer/edit_offer_screen.dart'
    show EditOfferScreen;

// تعريف الكلاس Offer
// هذا الكلاس يجب أن يكون في ملف منفصل (مثل models/offer.dart)
// أو في مكان يمكن استيراده من كلا الشاشتين FarmerProfileScreen و EditOfferScreen
class Offer {
  final String id;
  final String imageUrl;
  final String productName;
  final String type;
  final double price;
  final String delivery;
  final String storage;
  final String description;

  Offer({
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.type,
    required this.price,
    required this.delivery,
    required this.storage,
    required this.description,
  });
}

class FarmerProfileScreen extends StatelessWidget {
  const FarmerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width; // لم يتم استخدامها مباشرة هنا في الـ build

    // مثال على قائمة العروض (يمكن أن تأتي من API أو قاعدة بيانات)
    final List<Offer> farmerOffers = [
      Offer(
        id: '1',
        imageUrl: 'imgs/أفضل_أنواع_الأرز 1.png',
        productName: 'أرز أبيض',
        type: 'حبوب',
        price: 10000.0,
        delivery: 'متوفر',
        storage: 'جاف',
        description:
            'أريد طن أرز أبيض بسعر يتراوح بين 10000 و 9000 جنيه مع جودة جيدة',
      ),
      Offer(
        id: '2',
        imageUrl: 'imgs/القمح-1725709678-0.webp',
        productName: 'قمح عضوي',
        type: 'حبوب',
        price: 5500.0,
        delivery: 'غير متوفر حاليا',
        storage: 'بارد وجاف',
        description:
            'قمح عضوي بجودة ممتازة، سعر الطن 5500 جنيه. الكمية محدودة.',
      ),
      Offer(
        id: '3',
        imageUrl: 'imgs/rectangle 6.png',
        productName: 'ذرة صفراء',
        type: 'حبوب',
        price: 7200.0,
        delivery: 'متوفر',
        storage: 'جاف',
        description: 'ذرة صفراء علفية عالية الجودة، سعر الطن 7200 جنيه مصري.',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      // تم إزالة AppBar بالكامل
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Image and Text
            // استخدام Expanded داخل Column يتطلب أن يكون Column بداخل Flexible أو Expanded
            // لذا، سنقوم بتعديل ارتفاع الـ Stack ليكون ثابتًا أو يعتمد على الشاشة بشكل مباشر.
            Stack(
              children: [
                // الصورة الخلفية للرأس
                Container(
                  height:
                      screenHeight *
                      0.30, // تم زيادة الارتفاع ليتناسب بدون AppBar
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'imgs/WhatsApp Image 2025-05-30 at 19.24.24_6286ca45.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // الطبقة السوداء الشفافة مع النص
                Container(
                  height: screenHeight * 0.30, // نفس ارتفاع الصورة
                  color: Colors.black.withOpacity(0.3),
                  alignment: Alignment.center,
                  child: const Text(
                    'العروض التي قدمتها',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // (اختياري) يمكنك إضافة SafeArea هنا إذا كنت تريد ضمان عدم تداخل المحتوى مع شريط الحالة
                // Positioned(
                //   top: 0,
                //   left: 0,
                //   right: 0,
                //   child: SafeArea(
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           // يمكن إضافة زر رجوع أو أيقونات أخرى هنا إذا لزم الأمر
                //           // IconButton(
                //           //   icon: const Icon(Icons.arrow_back, color: Colors.white),
                //           //   onPressed: () {
                //           //     Navigator.pop(context);
                //           //   },
                //           // ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 20),

            // List of Offers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children:
                    farmerOffers.map((offer) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15.0,
                        ), // Space between cards
                        child: _buildOfferCard(
                          context: context,
                          offer: offer, // Pass the entire offer object
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build an individual offer card
  Widget _buildOfferCard({
    required BuildContext context,
    required Offer offer, // Receive the full Offer object
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Product Image
            Container(
              width: screenWidth * 0.25,
              height: screenWidth * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
                image: DecorationImage(
                  image: AssetImage(offer.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),

            // Product Name and Price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    offer.productName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${offer.price.toStringAsFixed(0)} جنيه', // Display price without decimals if whole number
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),

            // Action Buttons (Delete and Edit)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // print('Delete ${offer.productName}');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('تأكيد الحذف'),
                          content: Text(
                            'هل أنت متأكد أنك تريد حذف ${offer.productName}؟',
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('إلغاء'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('حذف'),
                              onPressed: () {
                                // Perform delete operation here
                                print('${offer.productName} deleted!');
                                Navigator.of(context).pop();
                                // You might need to refresh the list of offers here
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    print('Edit ${offer.productName}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditOfferScreen(offer: offer),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
