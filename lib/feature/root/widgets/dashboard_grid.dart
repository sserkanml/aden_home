import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:aden/feature/root/model/grid_view_model.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAll(),
      child: GridView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.navigateTo(gridviewData[index].route);
            },
            child: Card(
              elevation: 1,
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashboardSvgIcon(file: gridviewData[index].image),
                    const SizedBox(height: 10),
                    BodyMedium(
                      data: gridviewData[index].title,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    BodySmall(data: gridviewData[index].description)
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: gridviewData.length,
        primary: false,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      ),
    );
  }
}
