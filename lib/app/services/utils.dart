import 'package:get/get.dart';

class Utils {
  static validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "VALIDATE_EMAIL".tr;
    } else {
      bool isEmail = GetUtils.isEmail(email);
      if (isEmail) {
        return null;
      } else {
        return "VALIDATE_EMAIL".tr;
      }
    }
  }

  static validatePassword(String? password) {
    if (password == null) {
      return "VALIDATE_PASSWORD".tr;
    } else {
      if (password.length < 6) {
        return "MIN_CHARACTERS".tr;
      } else {
        return null;
      }
    }
  }
}
