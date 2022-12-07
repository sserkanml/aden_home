import 'package:aden/core/route/route_generator.dart';
import 'package:aden/feature/root/model/bottom_item_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../widgets/svg_icon.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DashboardWrapperRoute(children: [
          DashboardRoute(),
        ]),
        ItemsRoute(),
        SearchRoute(),
        NotificationRoute(),
        SettingsRoute()
      ],
      builder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            unselectedLabelStyle: context.textTheme.bodySmall!
                .copyWith(color: context.colorScheme.onSurface.withOpacity(.3)),
            currentIndex: tabsRouter.activeIndex,
            items: [
              ...List.generate(
                bottomItemData.length,
                (index) {
                  return BottomNavigationBarItem(
                      icon: BottomSvgIcon(
                          file: bottomItemData[index].file,
                          color: tabsRouter.activeIndex == index
                              ? context.colorScheme.primary
                              : context.colorScheme.onSurface.withOpacity(.3)),
                      label: bottomItemData[index].label);
                },
              )
            ]);
      },
    );
  }
}
