import 'package:hive/hive.dart';

class LocalStorage {
  static final Box box = Hive.box('app_data');

  static void saveUserType(String type) {
    box.put('userType', type);
  }

  static String? getUserType() {
    return box.get('userType');
  }
}