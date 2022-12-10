import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/headline6.dart';
import '../../settings/widgets/svg_setting_icon.dart';
import '../widgets/any_folder.dart';
import '../widgets/dashboard_list_for_routing.dart';
import '../widgets/dashboard_svg_icon.dart';
import '../widgets/everything_folder.dart';

class MoveSummaryView extends StatelessWidget {
  const MoveSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: context.colorScheme.background,
            child: Padding(
              padding: context.paddingAll(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AnyFolder(file: "folder_solid.svg", data: "Tüm Kök"),
                  Material(
                    child: IconButton(
                      onPressed: () {},
                      icon: const SvgSettingIcon(file: "exchange.svg"),
                    ),
                  ),
                  const Expanded(
                    child: AnyFolder(
                        file: "folder_solid.svg", data: "Herhangi Bir Hedef"),
                  )
                ],
              ),
            ),
          ),
          const EverythingFolder(),
          DashboardListForRouting(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  context.getPath(folder: "svg", file: "box_color.svg"),
                  width: 190,
                  height: 190,
                ),
                const Headline6(data: "Veri Bulunamadı"),
                const SizedBox(height: 10),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Yeni bir ",
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: context.colorScheme.onSurface)),
                  TextSpan(
                      text: "veri aralığı ",
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "ya da ",
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: context.colorScheme.onSurface)),
                  TextSpan(
                      text: "filtreni ",
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "düzenle",
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: context.colorScheme.onSurface)),
                ]))
              ],
            ),
          ))
        ],
      ),
      appBar: CustomAppBar(
          label: "Taşıma Özeti",
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
    );
  }
}
