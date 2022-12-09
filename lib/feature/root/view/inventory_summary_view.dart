import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';
import '../widgets/dashboard_svg_icon.dart';

class InventorySummaryView extends StatelessWidget {
  const InventorySummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Envanter Özeti",
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
    );
  }
}
