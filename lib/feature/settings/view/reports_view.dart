import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:aden/feature/root/widgets/bottom_icon_svg.dart';
import 'package:aden/feature/settings/model/reports_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodymedium.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Raporlar",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        autoImplicity: true,
        context: context,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: context.paddingAll(),
        child: Column(
          children: <Widget>[
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: BottomSvgIcon(
                      file: reportsModelData[index].file,
                      color: context.colorScheme.onSurface,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 0,
                    ),
                    onTap: () {
                      context.router.push(reportsModelData[index].route);
                    },
                    subtitle: BodySmall(data: reportsModelData[index].subtitle),
                    title: BodyMedium(
                      data: reportsModelData[index].name,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.3),
                  );
                },
                itemCount: reportsModelData.length)
          ],
        ),
      )),
    );
  }
}
