import 'package:aden/core/route/route_generator.dart';
import 'package:auto_route/auto_route.dart';

class GridViewModel {
  final String title;
  final String description;
  final String image;
  final PageRouteInfo<dynamic> route;

  GridViewModel(
      {required this.title,
      required this.route,
      required this.description,
      required this.image});
}

List<GridViewModel> gridviewData = [
  GridViewModel(
      title: "Düşük Stok",
      description: "Düşük envanter olan tüm stok kalemlerini görüntüle",
      image: "trend_down.svg",
      route: const LowStockRoute()),
  GridViewModel(
      route: const QtyChangesRoute(),
      title: "Miktar Değişikleri",
      description: "Bir kalem için tüm giriş ve çıkışları görüntüleyin",
      image: "chart.svg"),
  GridViewModel(
      route: const MoveSummaryRoute(),
      title: "Taşıma Özetleri",
      description: "Yerleri taşınan envanteri takip edin",
      image: "file_move.svg"),
  GridViewModel(
      route: const TransactionReportRoute(),
      title: "İşlem Geçmişi",
      description:
          "Tüm miktar güncellemelerini, hareketlerini ve klonları görü",
      image: "renewable.svg")
];
