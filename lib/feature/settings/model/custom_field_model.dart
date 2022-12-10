class CustomFieldModelOwn {
  final String name;
  final String? subtitle;
  final String file;

  CustomFieldModelOwn({required this.name, this.subtitle, required this.file});
}

List<CustomFieldModelOwn> customfielddata = [
  CustomFieldModelOwn(
      name: "Küçük Yazı Kutusu", file: "t.svg", subtitle: "190 karakter"),
  CustomFieldModelOwn(
      name: "Geniş Yazı Kutusu",
      file: "largetext.svg",
      subtitle: "400 karakter"),
  CustomFieldModelOwn(name: "Ondalıklı Sayı", file: "decimal.svg"),
  CustomFieldModelOwn(name: "Checkbox", file: "checkbox.svg"),
  CustomFieldModelOwn(name: "Dropdown", file: "dropdown.svg"),
  CustomFieldModelOwn(name: "Tarih", file: "date.svg"),
  CustomFieldModelOwn(name: "Tarayıcı", file: "scanner.svg"),
  CustomFieldModelOwn(name: "Telefon Numarası", file: "phone.svg"),
  CustomFieldModelOwn(name: "Web Linki", file: "link.svg"),
  CustomFieldModelOwn(name: "Email", file: "email.svg"),
];

class CustomFieldModelSuggested {
  final String name;
  final String? subtitle;
  final String file;

  CustomFieldModelSuggested(
      {required this.name, this.subtitle, required this.file});
}

List<CustomFieldModelSuggested> customfieldsuggsteddata = [
  CustomFieldModelSuggested(
      name: "Seri Numarası", file: "t.svg", subtitle: "Küçük Yazı Kutusu"),
  CustomFieldModelSuggested(
      name: "Boyut", file: "t.svg", subtitle: "Küçük Yazı Kutusu"),
  CustomFieldModelSuggested(
      name: "Son Kullanma Tarihi", file: "date.svg", subtitle: "Tarih"),
  CustomFieldModelSuggested(
      name: "Satın Alım Tarihi", file: "date.svg", subtitle: "Tarih"),
  CustomFieldModelSuggested(
      name: "Ürün Link", file: "link.svg", subtitle: "Web Link"),
  CustomFieldModelSuggested(
      name: "Model/Parça Numarası",
      file: "t.svg",
      subtitle: "Küçük Yazı Kutusu"),
];
