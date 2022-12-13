import 'package:aden/core/util/extension.dart';
import 'package:aden/feature/root/widgets/any_folder_without_icon.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bodymedium.dart';
import '../widgets/any_folder.dart';
import '../widgets/dashboard_list_for_routing.dart';
import '../widgets/dashboard_svg_icon.dart';
import '../widgets/everything_folder.dart';

class TransactionReportView extends StatelessWidget {
  const TransactionReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "İşlem Geçmişi",
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
      body: Column(
        children: [
          Container(
            color: context.colorScheme.background,
            child: Padding(
              padding: context.paddingAll(),
              child: Row(
                children: const [
                  AnyFolder(file: "folder_solid.svg", data: "Tüm Kök"),
                  SizedBox(width: 20),
                  AnyFolderWithoutIcon(data: "Tüm  İşlemler")
                ],
              ),
            ),
          ),
          const EverythingFolder(),
          DashboardListForRouting(
              child: Column(
            children: <Widget>[
              Expanded(
                flex: 10,
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
