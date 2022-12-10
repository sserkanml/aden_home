import 'package:aden/feature/project/view/create_items_view.dart';
import 'package:aden/feature/root/widgets/dashboard_list_no_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/route/route_generator.dart';

class DashboardList extends StatelessWidget {
  const DashboardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      height: context.dynamicHeight(.34),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 170,
            child: InkWell(
              onTap: () {
                context.router.push(const CreateItemsRoute());
              },
              child: const Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 1,
                margin: EdgeInsets.only(right: 10),
                child: DashboardListNoItem(),
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
