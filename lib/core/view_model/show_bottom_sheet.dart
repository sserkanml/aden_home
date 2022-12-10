import 'package:aden/core/model/bottom_sheet_ellipsis.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../widgets/bodymedium.dart';

class ShowBottomSheet {
 static void ellipsisBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      useRootNavigator: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      builder: (context) {
        return ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                title: BodyMedium(data: bottomsheetellipsisdata[index].name),
                leading:
                    DashboardSvgIcon(file: bottomsheetellipsisdata[index].file),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 0,
                color: context.colorScheme.onSurface.withOpacity(.3),
              );
            },
            itemCount: bottomsheetellipsisdata.length);
      },
    );
  }
}
