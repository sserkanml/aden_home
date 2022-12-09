import 'package:aden/feature/root/widgets/everything_folder.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';
import '../../root/widgets/dashboard_svg_icon.dart';

class ActivityHistoryView extends StatelessWidget {
const ActivityHistoryView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: CustomAppBar(
        label: "Eylem Geçmişi",
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
          EverythingFolder(),
          Expanded(
            child: Container(
             color: context.colorScheme.background,
            ),
          )
        ],
      ),
    );
  }
}