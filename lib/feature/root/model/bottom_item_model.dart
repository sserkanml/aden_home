class BottomItemModel {
  final String file;
  final String label;

  BottomItemModel({required this.file, required this.label});
}

List<BottomItemModel> bottomItemData = [
  BottomItemModel(file: "dashboard.svg", label: "Dashboard"),
  BottomItemModel(file: "box.svg", label: "Malzeme"),
  BottomItemModel(file: "search.svg", label: "Arama"),
  BottomItemModel(file: "bell.svg", label: "Bildirimler"),
  BottomItemModel(file: "bar.svg", label: "Ayarlar"),
];
