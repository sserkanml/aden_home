import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LowStockView extends StatelessWidget {
  const LowStockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Düşük Stok",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        autoImplicity: true,
        context: context,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const DashboardSvgIcon(file: "ellipsis.svg"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              context.getPath(folder: "svg", file: "empty_box.svg"),
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 20),
            const BodyMedium(data: "Malzeme Bulunamadı")
          ],
        ),
      ),
    );
  }
}
