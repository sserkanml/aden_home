import 'package:flutter/widgets.dart';

class FormFolder {
  static GlobalKey<FormState> formFolder = GlobalKey();
  static String folderName = "";
  static bool validateForm() {
    if (formFolder.currentState!.validate()) {
      formFolder.currentState!.save();
      return true;
    } else {
      return false;
    }
  }
}
