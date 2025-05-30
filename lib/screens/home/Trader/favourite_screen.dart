import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'product_details.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Map<String, String>> favourites = [
    {
      'name': 'ارز ابيض',
      'price': '15000',
      'image': 'imgs/أفضل_أنواع_الأرز 1.png',
      'description': 'أرز أبيض عالي الجودة',
      'type': 'حبوب',
      'seller': 'عادل محمد',
      'date': '28 نوفمبر 2024',
      'isNew': 'true',
    },
    {
      'name': 'عنب احمر',
      'price': '10000',
      'image': 'imgs/tbl_articles_article_17762_957 1.png',
      'description': 'عنب أحمر طازج',
      'type': 'فاكهة',
      'seller': 'عادل محمد',
      'date': '28 نوفمبر 2024',
      'isNew': 'false',
    },
    {
      'name': 'بذور الكتان',
      'price': '7000',
      'image': 'imgs/Group 17640.png',
      'description': 'بذور الكتان الطبيعية',
      'type': 'بذور',
      'seller': 'عادل محمد',
      'date': '28 نوفمبر 2024',
      'isNew': 'true',
    },
  ];
  int? _recentlyDeletedIndex;
  Map<String, String>? _recentlyDeletedItem;

  void _removeItem(int index) {
    setState(() {
      _recentlyDeletedItem = favourites[index];
      _recentlyDeletedIndex = index;
      favourites.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم حذف "${_recentlyDeletedItem!['name']}" من المفضلة'),
        action: SnackBarAction(
          label: 'تراجع',
          onPressed: () {
            setState(() {
              if (_recentlyDeletedIndex != null &&
                  _recentlyDeletedItem != null) {
                favourites.insert(
                  _recentlyDeletedIndex!,
                  _recentlyDeletedItem!,
                );
              }
            });
          },
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToDetails(Map<String, String> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ProductDetailsScreen(
              name: item['name']!,
              image: item['image']!,
              description: item['description']!,
              price: item['price']!,
              type: item['type']!,
              seller: item['seller']!,
              date: item['date']!,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    final ts = MediaQuery.of(context).textScaleFactor;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Stack(
          children: [
            // الهيدر: صورة أوراق مع تدرج لوني
            Container(
              height: sh * 0.28,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                    'imgs/istockphoto-1221724425-612x612 1.png',
                  ),
                  fit: BoxFit.cover,
                  colorFilter:
                      isDark
                          ? ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.darken,
                          )
                          : null,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.primaryColor.withOpacity(0.7),
                      theme.primaryColor.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // الانحناء الأبيض الكبير
            Positioned(
              top: sh * 0.18,
              left: 0,
              right: 0,
              child: Container(
                height: sh * 0.13,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
              ),
            ),
            // العنوان
            Positioned(
              top: sh * 0.11,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'المفضلة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30 * ts,
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
            // القائمة أو رسالة فارغة
            Padding(
              padding: EdgeInsets.only(top: sh * 0.23),
              child:
                  favourites.isEmpty
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 60,
                              color: theme.primaryColor.withOpacity(0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'لا توجد منتجات في المفضلة بعد',
                              style: TextStyle(
                                fontSize: 18 * ts,
                                color: theme.hintColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.storefront),
                              label: const Text('تصفح المنتجات'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      : ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: sw * 0.04,
                          vertical: sh * 0.01,
                        ),
                        itemCount: favourites.length,
                        itemBuilder: (context, index) {
                          final item = favourites[index];
                          return Dismissible(
                            key: Key(
                              item['name']! + item['price']! + item['date']!,
                            ),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: sw * 0.06),
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 32,
                              ),
                            ),
                            onDismissed: (_) => _removeItem(index),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => HapticFeedback.lightImpact(),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                margin: EdgeInsets.only(bottom: sh * 0.018),
                                decoration: BoxDecoration(
                                  color: theme.cardColor,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          isDark
                                              ? Colors.black.withOpacity(0.18)
                                              : Colors.grey.withOpacity(0.18),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: sh * 0.012,
                                    horizontal: sw * 0.018,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // الصورة
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: Image.asset(
                                          item['image']!,
                                          width: sw * 0.18,
                                          height: sw * 0.18,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: sw * 0.03),
                                      // الاسم والسعر والزر والمعلومات الإضافية
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (item['isNew'] == 'true')
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                          left: 6,
                                                        ),
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 2,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: theme.primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                    child: const Text(
                                                      'جديد',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                Flexible(
                                                  child: Text(
                                                    item['name']!,
                                                    textAlign: TextAlign.right,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16 * ts,
                                                      color:
                                                          theme
                                                              .textTheme
                                                              .bodyMedium!
                                                              .color,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: sh * 0.004),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.attach_money,
                                                  color: Colors.green,
                                                  size: 16 * ts,
                                                ),
                                                SizedBox(width: 2),
                                                Text(
                                                  item['price']!,
                                                  style: TextStyle(
                                                    fontSize: 15 * ts,
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  'ج.م',
                                                  style: TextStyle(
                                                    fontSize: 14 * ts,
                                                    color:
                                                        Colors.green.shade700,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: sh * 0.004),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.category,
                                                  size: 15,
                                                  color: theme.hintColor,
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                  item['type']!,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: theme.hintColor,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Icon(
                                                  Icons.person,
                                                  size: 15,
                                                  color: theme.hintColor,
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                  item['seller']!,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: theme.hintColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: sh * 0.004),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 13,
                                                  color: theme.hintColor,
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                  item['date']!,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: theme.hintColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: sh * 0.01),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: SizedBox(
                                                height: sh * 0.038,
                                                child: ElevatedButton(
                                                  onPressed:
                                                      () => _navigateToDetails(
                                                        item,
                                                      ),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        theme.primaryColor,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: sw * 0.04,
                                                        ),
                                                    elevation: 0,
                                                    minimumSize: Size(0, 0),
                                                    tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                  ),
                                                  child: Text(
                                                    'عرض المزيد',
                                                    style: TextStyle(
                                                      fontSize: 12 * ts,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: sw * 0.01),
                                      // زر الحذف دائري صغير يظهر فقط عند السحب
                                      AnimatedOpacity(
                                        opacity: 1.0,
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        child: Material(
                                          color: Colors.red.shade50,
                                          shape: const CircleBorder(),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.delete_outline,
                                              color: Colors.red.shade400,
                                              size: 22,
                                            ),
                                            onPressed: () => _removeItem(index),
                                            tooltip: 'إزالة من المفضلة',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
