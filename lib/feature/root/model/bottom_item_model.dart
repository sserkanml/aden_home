class BottomItemModel {
  final String file;
  final String label;
  final int id;

  BottomItemModel({required this.file, required this.label,required this.id});
}

List<BottomItemModel> bottomItemData = [
  BottomItemModel(file: "dashboard.svg", label: "Dashboard", id: 0),
  BottomItemModel(file: "box.svg", label: "Malzeme", id: 1),
  BottomItemModel(file: "search.svg", label: "Arama", id: 2),
  BottomItemModel(file: "bell.svg", label: "Bildirimler", id: 3),
  BottomItemModel(file: "bar.svg", label: "Ayarlar", id: 4),
];
