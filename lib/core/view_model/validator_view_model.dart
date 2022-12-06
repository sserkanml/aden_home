class ValidatorService {
  String? validateIsEmpty({String? value}) {
    if (value != null || value!.isEmpty) {
      return "Bu alan boş geçilemez";
    } else {
      return null;
    }
  }

  String? validatePassword({required String value}) {
    if (value.length < 8) {
      return "En az 8 karakter girilmelidir";
    } else {
      return null;
    }
  }
}
