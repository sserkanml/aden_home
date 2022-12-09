import 'package:aden/core/route/route_generator.dart';
import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:aden/feature/root/widgets/inventory_widget_content.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class InventoryWidgets extends StatelessWidget {
  const InventoryWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAll(),
      child: InkWell(
        onTap: () {
          context.router.push(const InventorySummaryRoute());
        },
        child: Card(
          elevation: 1,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DashboardSvgIcon(file: "stack.svg"),
                      DashboardSvgIcon(file: "help_circle.svg"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const BodyMedium(
                    data: "Envanter Özeti",
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  const InventoryWidgetContent(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
