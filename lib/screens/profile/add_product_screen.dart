import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final priceController = TextEditingController();
  final deliveryController = TextEditingController();
  final storageController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: Text("إضافة صورة", style: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(height: 20),
              buildField("اسم المنتج", nameController),
              buildField("النوع", typeController),
              buildField("السعر", priceController),
              buildField("التوصيل", deliveryController),
              buildField("تخزين", storageController),
              buildField("الوصف", descController, maxLines: 3),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Icon(Icons.check_circle,
                          size: 60, color: Colors.green),
                      content: Text("تم نشر المنتج الخاص بك بنجاح"),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("استمر"))
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.green),
                child: Text("نشر"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
