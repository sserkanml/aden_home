import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/settings/model/settings_inside_model.dart';
import 'package:aden/feature/settings/widgets/svg_setting_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';

class SettingsInsideView extends StatelessWidget {
  const SettingsInsideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Ayarlar",
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
          children: [
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.router.push(preferencesSettingsData[index].route);
                    },
                    leading: SvgSettingIcon(
                        file: preferencesSettingsData[index].file),
                    title:
                        BodyMedium(data: preferencesSettingsData[index].name),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.3),
                  );
                },
                itemCount: preferencesSettingsData.length)
          ],
        ),
      )),
    );
  }
}
