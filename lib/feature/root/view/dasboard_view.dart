import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/feature/root/widgets/dashboard_grid.dart';
import 'package:aden/feature/root/widgets/dashboard_list.dart';
import 'package:aden/feature/root/widgets/inventory_widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/last_added.dart';

class DashboardView extends StatelessWidget {
   DashboardView({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: "Dashboard", context: context),
      body: SingleChildScrollView(
        
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            InventoryWidgets(),
            DashboardGrid(),
            SizedBox(
              height: 10,
            ),
            LastAdded(),
            SizedBox(
              height: 10,
            ),
            DashboardList()
          ],
        ),
      ),
    );
  }
}
