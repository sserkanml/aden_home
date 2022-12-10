import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:aden/feature/settings/model/custom_field_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bodymedium.dart';

class CustomFieldView extends StatelessWidget {
  const CustomFieldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Özel Input Ekle",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: context.paddingAll(),
              child: BodyLarge(
                data: "Önerilenler",
                color: context.colorScheme.onSurface.withOpacity(.5),
                fontweight: FontWeight.bold,
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    title:
                        BodyMedium(data: customfieldsuggsteddata[index].name),
                    leading: DashboardSvgIcon(
                        file: customfieldsuggsteddata[index].file),
                    subtitle: BodySmall(
                      data: customfieldsuggsteddata[index].subtitle ?? "",
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.3),
                  );
                },
                itemCount: customfieldsuggsteddata.length),
            Padding(
              padding: context.paddingAll(),
              child: BodyLarge(
                data: "Özel Oluştur",
                color: context.colorScheme.onSurface.withOpacity(.5),
                fontweight: FontWeight.bold,
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    leading:
                        DashboardSvgIcon(file: customfielddata[index].file),
                    subtitle: BodySmall(
                      data: customfielddata[index].subtitle ?? "",
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    ),
                    title: BodyMedium(data: customfielddata[index].name),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.3),
                  );
                },
                itemCount: customfielddata.length)
          ],
        ),
      )),
    );
  }
}
