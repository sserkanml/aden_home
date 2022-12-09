import 'package:aden/core/route/route_generator.dart';
import 'package:aden/feature/root/model/bottom_item_model.dart';
import 'package:aden/feature/root/widgets/bottom_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      animationDuration: const Duration(milliseconds: 0),
      routes: [
        DashboardWrapperRoute(children: [DashboardRoute()]),
        const ItemsRoute(),
        const SearchRoute(),
        const NotificationRoute(),
        const SettingsWrapperRoute()
      ],
      builder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        return InkWell(
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: context.colorScheme.background,
                boxShadow: [
                  BoxShadow(
                      color: context.colorScheme.onSurface.withOpacity(.7))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomItemData.length,
                  (index) {
                    return Expanded(
                      child: BottomBarItemWidget(
                          callback: () {
                            setState(() {
                              tabsRouter
                                  .setActiveIndex(bottomItemData[index].id);
                            });
                          },
                          file: bottomItemData[index].file,
                          color: index == tabsRouter.activeIndex
                              ? context.colorScheme.primary
                              : context.colorScheme.onSurface.withOpacity(.4),
                          data: bottomItemData[index].label),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
