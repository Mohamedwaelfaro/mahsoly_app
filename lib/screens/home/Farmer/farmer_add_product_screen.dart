import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // لإضافة الصور
import 'dart:io';

import 'package:mahsoly_app1/screens/home/Farmer/farmer_home_screen.dart'; // للتعامل مع الملفات (الصور)

class FarmerAddProductScreen extends StatefulWidget {
  const FarmerAddProductScreen({super.key});

  @override
  State<FarmerAddProductScreen> createState() => _FarmerAddProductScreenState();
}

class _FarmerAddProductScreenState extends State<FarmerAddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Controllers for text fields
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productTypeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressFromController = TextEditingController();
  final TextEditingController _addressToController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data (e.g., send to API, save locally)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('جاري إضافة المنتج...')));
      // Example: Print data to console
      print('اسم المنتج: ${_productNameController.text}');
      print('النوع: ${_productTypeController.text}');
      print('السعر: ${_priceController.text}');
      print('موبايل: ${_mobileController.text}');
      print('العنوان من: ${_addressFromController.text}');
      print('العنوان الي: ${_addressToController.text}');
      print('الوصف: ${_descriptionController.text}');
      if (_image != null) {
        print('مسار الصورة: ${_image!.path}');
      }
      // You would typically navigate away or clear the form here
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _productNameController.dispose();
    _productTypeController.dispose();
    _priceController.dispose();
    _mobileController.dispose();
    _addressFromController.dispose();
    _addressToController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'إضافة منتج',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              // Handle back button or other action
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FarmerHomeScreen()),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false, // To use custom leading action
        centerTitle: true, // Center the title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Image Picker
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.grey[400]!, width: 1),
                  ),
                  child:
                      _image == null
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 60,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'إضافة صورة',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(
                              11.0,
                            ), // one less than container for better fit
                            child: Image.file(
                              _image!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                ),
              ),
              const SizedBox(height: 25),

              // Product Name
              _buildTextField(
                controller: _productNameController,
                labelText: 'اسم المنتج',
                hintText: 'ادخل اسم المنتج (مثال: ارز)',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال اسم المنتج';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Product Type
              _buildTextField(
                controller: _productTypeController,
                labelText: 'النوع',
                hintText: 'ادخل نوع المنتج (مثال: بذور)',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال نوع المنتج';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Price
              _buildTextField(
                controller: _priceController,
                labelText: 'السعر',
                hintText: 'ادخل السعر (مثال: 10000.0 ج.م)',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال السعر';
                  }
                  if (double.tryParse(value) == null) {
                    return 'الرجاء إدخال سعر صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Mobile Number
              _buildTextField(
                controller: _mobileController,
                labelText: 'موبايل',
                hintText: 'ادخل رقم الموبايل (مثال: 01234567891)',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال رقم الموبايل';
                  }
                  if (value.length < 11 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'الرجاء إدخال رقم موبايل صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),

              // Address Section Title
              Text(
                'العنوان :',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),

              // Address From
              _buildTextField(
                controller: _addressFromController,
                labelText: 'من',
                hintText: 'مثال: اسوان - اسوان شارع السادات',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال عنوان البداية';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Address To
              _buildTextField(
                controller: _addressToController,
                labelText: 'الي',
                hintText: 'مثال: سوهاج - سوهاج شارع السادات',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال عنوان النهاية';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),

              // Description
              Text(
                'الوصف :',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _descriptionController,
                hintText:
                    'ادخل وصف المنتج (مثال: طن ارز ابيض بسعر 1000 جم مع جودة جيدة)',
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال وصف المنتج';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo', // يمكنك تغيير الخط حسب رغبتك
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'انشر',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? labelText, // أصبح اختياريًا
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      textAlign: TextAlign.right, // لمحاذاة النص المدخل إلى اليمين
      decoration: InputDecoration(
        labelText: labelText, // سيظهر فوق الحقل عند التركيز أو إذا كان هناك نص
        hintText: hintText,
        alignLabelWithHint: true, // لمحاذاة الـ label مع الـ hint
        floatingLabelBehavior:
            labelText != null
                ? FloatingLabelBehavior.auto
                : FloatingLabelBehavior.never,
        hintStyle: TextStyle(color: Colors.grey[500]),
        labelStyle: TextStyle(
          color: Colors.green[700],
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.green[700]!, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red[700]!, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red[700]!, width: 2),
        ),
        // إذا لم يكن هناك labelText، يمكننا استخدام prefixIcon لمحاذاة النص في الـ hint
        prefixIcon: labelText == null ? Container(width: 0) : null,
      ),
      validator: validator,
      // لجعل الكتابة تبدأ من اليمين حتى لو كان الهاتف باللغة الإنجليزية
      textDirection: TextDirection.rtl,
    );
  }
}
