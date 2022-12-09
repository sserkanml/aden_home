import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:aden/core/widgets/headline6.dart';
import 'package:aden/feature/settings/model/settings_list_item.dart';
import 'package:aden/feature/settings/widgets/svg_setting_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: context.dynamicWidth(1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              CircleAvatar(
                backgroundColor: context.colorScheme.onSurface.withOpacity(.09),
                radius: 40,
                child: const Headline6(
                  data: "SN",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const BodyLarge(
                data: "Serkan Namlı",
                fontweight: FontWeight.bold,
              ),
              const SizedBox(height: 6),
              const BodySmall(data: "Bisod"),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: context.paddingAll(),
                child: SizedBox(
                  width: context.dynamicWidth(1),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Yükseltmeleri Gör",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                title: const BodyMedium(data: "Karanlık Tema"),
                trailing: Switcher(
                  value:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? false
                          : true,
                  colorOn: context.colorScheme.primary,
                  onTap: () {
                    if (AdaptiveTheme.of(context).mode ==
                        AdaptiveThemeMode.light) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  },
                  size: SwitcherSize.medium,
                  colorOff: context.colorScheme.onSurface.withOpacity(.2),
                  onChanged: (p0) {},
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.09),
                  );
                },
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.router.push(settingsListData[index].route);
                    },
                    title: BodyMedium(data: settingsListData[index].label),
                    leading:
                        SvgSettingIcon(file: settingsListData[index].image),
                  );
                },
                itemCount: settingsListData.length,
              ),
              const SizedBox(height: 10),
              BodyLarge(
                data: "Versiyon 1.0.0",
                fontweight: FontWeight.bold,
                color: context.colorScheme.onSurface.withOpacity(.3),
              ),
              const BodySmall(data: "From Bisod")
            ],
          ),
        ),
      )),
    );
  }
}
