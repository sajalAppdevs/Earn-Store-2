import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static Future<void> setUserID({required int userID}) async {
    final box = GetStorage();
    await box.write("userID", userID);
  }

  static Future<int> getUserID() async {
    final box = GetStorage();
    int? userID = box.read("userID");
    if (userID == null) {
      return 0;
    } else {
      return userID.toInt();
    }
  }
}
