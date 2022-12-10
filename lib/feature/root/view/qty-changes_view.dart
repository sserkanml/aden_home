import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/root/widgets/any_folder.dart';
import 'package:aden/feature/root/widgets/dashboard_list_for_routing.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:aden/feature/root/widgets/everything_folder.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class QtyChangesView extends StatelessWidget {
  const QtyChangesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          label: "Miktar Değişikliği",
          actions: [
            IconButton(
              onPressed: () {},
              icon: const DashboardSvgIcon(file: "filter.svg"),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          context: context),
      body: Column(
        children: [
          Container(
            color: context.colorScheme.background,
            child: Padding(
              padding: context.paddingAll(),
              child: const AnyFolder(file: "folder_solid.svg", data: "Tüm Kök"),
            ),
          ),
          const EverythingFolder(),
          DashboardListForRouting(
              child: Column(
            children: <Widget>[
              Padding(
                padding: context.paddingAll(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    BodyMedium(data: "İsim"),
                    BodyMedium(data: "Miktar Değişimleri"),
                  ],
                ),
              ),
              Expanded(
                   
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
