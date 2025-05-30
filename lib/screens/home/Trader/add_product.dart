import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // Controllers for text fields
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController deliveryController = TextEditingController();
  final TextEditingController storageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    productNameController.dispose();
    typeController.dispose();
    priceController.dispose();
    deliveryController.dispose();
    storageController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  // Function to show the success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap 'استمر' to dismiss
      builder: (BuildContext context) {
        final sw = MediaQuery.of(context).size.width;
        final ts = MediaQuery.of(context).textScaleFactor;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: const EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: sw * 0.1,
                  backgroundColor: const Color(0xFF4CAF50), // Green color
                  child: Icon(Icons.check, color: Colors.white, size: sw * 0.1),
                ),
                SizedBox(height: 20),
                Text(
                  'تم نشر المنتج الخاص بك بنجاح',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18 * ts,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    // Optionally, navigate back or to another screen
                    // Navigator.of(context).pop(); // If you want to go back to previous screen after success
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50), // Green button
                    minimumSize: Size(sw * 0.5, 45), // Responsive width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'استمر',
                    style: TextStyle(color: Colors.white, fontSize: 16 * ts),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    final ts = MediaQuery.of(context).textScaleFactor;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100, // Light background
        // AppBar has been removed from here
        body: SingleChildScrollView(
          padding: EdgeInsets.all(sw * 0.04), // Global padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Upload Section
              GestureDetector(
                onTap: () {
                  // Handle image selection logic here
                  print('Add photo tapped!');
                },
                child: Container(
                  width: double.infinity,
                  height: sh * 0.2, // Responsive height for image container
                  decoration: BoxDecoration(
                    color: Colors.white, // White background
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ), // Light border
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image, // Placeholder image icon
                        size: sw * 0.15, // Responsive icon size
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: sh * 0.01),
                      Text(
                        'اضافة صورة', // Text "اضافة صورة"
                        style: TextStyle(
                          fontSize: 16 * ts,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sh * 0.02), // Space after image section
              // Input Fields Grid (or Column for simplicity)
              _buildInputField(
                context,
                'اسم المنتج', // Label "اسم المنتج"
                productNameController,
                hintText: 'ارز', // Hint text "ارز"
                keyboardType: TextInputType.text,
                labelWidthFactor: 0.3,
              ),
              _buildInputField(
                context,
                'النوع', // Label "النوع"
                typeController,
                hintText: 'بذور', // Hint text "بذور"
                keyboardType: TextInputType.text,
                labelWidthFactor: 0.3,
              ),
              _buildInputField(
                context,
                'السعر', // Label "السعر"
                priceController,
                hintText: '10000.0 جم', // Hint text "10000.0 جم"
                keyboardType: TextInputType.number,
                labelWidthFactor: 0.3,
              ),
              _buildInputField(
                context,
                'التوصيل', // Label "التوصيل"
                deliveryController,
                hintText: 'بدون', // Hint text "بدون"
                keyboardType: TextInputType.text,
                labelWidthFactor: 0.3,
              ),
              _buildInputField(
                context,
                'تخزين', // Label "تخزين"
                storageController,
                hintText: 'بدون', // Hint text "بدون"
                keyboardType: TextInputType.text,
                labelWidthFactor: 0.3,
              ),

              SizedBox(height: sh * 0.02),

              // Description field
              _buildInputField(
                context,
                'الوصف', // Label "الوصف"
                descriptionController,
                hintText:
                    'اريد طن ارز ابيض بسعر يتراوح بين 10000 و 9000 جنيه مع جودة جيدة', // Hint text
                keyboardType: TextInputType.multiline,
                maxLines: 4, // Allow multiple lines
                alignLabelStart:
                    true, // Align "الوصف" to the right (start in RTL)
                labelWidthFactor: 0.2, // Adjust label width for description
              ),

              SizedBox(height: sh * 0.03),

              // Publish Button
              ElevatedButton(
                onPressed: () {
                  // Perform validation or data submission here
                  print('Publish button pressed!');
                  _showSuccessDialog(); // Show success dialog on press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50), // Green button
                  minimumSize: Size(
                    double.infinity,
                    50,
                  ), // Full width, fixed height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'انشر', // Text "انشر"
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18 * ts,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for input fields
  Widget _buildInputField(
    BuildContext context,
    String label,
    TextEditingController controller, {
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    double labelWidthFactor = 0.4, // Default width factor for label
    bool alignLabelStart =
        false, // To control label alignment for multi-line fields
  }) {
    final sw = MediaQuery.of(context).size.width;
    final ts = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align to top for multi-line
        children: [
          SizedBox(
            width: sw * labelWidthFactor, // Responsive width for label
            child: Text(
              '$label :',
              style: TextStyle(
                fontSize: 16 * ts,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right, // Always right align label for RTL
            ),
          ),
          SizedBox(width: sw * 0.02), // Space between label and input field
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14 * ts,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ), // Light border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1.5,
                  ), // Green border on focus
                ),
              ),
              style: TextStyle(fontSize: 16 * ts, color: Colors.black),
              textAlign: TextAlign.right, // Text input direction for RTL
            ),
          ),
        ],
      ),
    );
  }
}
