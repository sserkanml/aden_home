import 'package:aden/core/route/route_generator.dart';
import 'package:auto_route/auto_route.dart';

class ReportsModel {
  final String name;
  final String file;
  final String subtitle;
  final PageRouteInfo<dynamic> route;

  ReportsModel(
      {required this.name,
      required this.file,
      required this.subtitle,
      required this.route});
}

List<ReportsModel> reportsModelData = [
  ReportsModel(
      name: "Envanter Özeti",
      file: "stack.svg",
      subtitle:
          "Stokunuzun toplam miktarını ve değerini bir bakışta gözden geçirin.Belirli bir konumdaki veya bir klasördeki malzemeleri ve varlıkları incelemek için harika",
      route: const InventorySummaryRoute()),
  ReportsModel(
      name: "Düşük Stok",
      file: "trend_down.svg",
      subtitle:
          "Stok düzeyi düşük olan tüm stok kalemlerini görüntüleyin, böylece ihtiyacınız olan şey hiçbir zaman tükenmez",
      route: const LowStockRoute()),
  ReportsModel(
      name: "Miktar Değişiklik",
      file: "chart.svg",
      subtitle:
          "Belirli bir zaman aralığındaki değişiklikleri anlamak için bir öğenin tüm giriş ve çıkışlarını görüntüleyin.İzlenecek doğru stoğu bulmak için sağlam filtreler kullanın",
      route: const QtyChangesRoute()),
  ReportsModel(
      name: "Taşıma Raporu Özeti",
      file: "file_move.svg",
      subtitle:
          "Haftalık veya aylık olarak konum değiştiren envanteri takip edin",
      route: const MoveSummaryRoute()),
  ReportsModel(
      name: "İşlem Özeti",
      file: "renewable.svg",
      subtitle:
          "Envanterinizdeki tüm miktar değişikliklerini, hareketleri, klonları, eklemeleri ve silmeleri görün. Bir ekip üyesinin etkinliğini incelemek veya bir klasörü izlemek için kullanışlıdır.",
      route: const TransactionReportRoute()),
 
];
