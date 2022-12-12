import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';

class ValidatorService {
  static GlobalKey<FormState> signUpForm = GlobalKey();
  static String? validateIsEmpty({required String value}) {
    if (value == null || value.isEmpty) {
      return "Bu alan boş geçilemez";
    } else {
      return null;
    }
  }

  static void validateForm() {
    if (signUpForm.currentState!.validate()) {
      signUpForm.currentState?.save();
    } else {
      return;
    }
  }

  static String? validatePassword({required String value}) {
    if (value.length < 8) {
      return "En az 8 karakter girilmelidir";
    } else {
      return null;
    }
  }

  static String? validateEmail({required String value}) {
    if (EmailValidator.validate(value )) {
      return "Geçerli bir email adresi giriniz";
    } else {
      return null;
    }
  }
}
