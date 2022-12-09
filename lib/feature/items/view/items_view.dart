import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/items/widgets/items_summary_info.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:aden/feature/root/widgets/inventory_widget_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: itemsappbar(context),
      floatingActionButton: itemsfloatingactionbutton(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
                color: context.colorScheme.background,
                child: const ItemsSummaryInfo())
          ],
        ),
      )),
    );
  }

  FloatingActionButton itemsfloatingactionbutton(BuildContext context) {
    return FloatingActionButton(
      heroTag: "itemsAddItem",
      onPressed: () {
        showModalBottomSheet(
          clipBehavior: Clip.none,
          useRootNavigator: true,
          context: context,
          builder: (context) {
            return SizedBox(
              height: context.dynamicHeight(.3),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -30,
                    right: 40,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colorScheme.primary,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: context.paddingAll(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BodyLarge(data: "Ekleme yap"),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: context.dynamicWidth(1),
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      context.getPath(
                                        folder: "svg",
                                        file: "file.svg",
                                      ),
                                      width: 40,
                                      height: 40,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 40),
                                    const BodyMedium(
                                      data: "Malzeme Ekle",
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: context.dynamicWidth(1),
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      context.getPath(
                                        folder: "svg",
                                        file: "folder_solid.svg",
                                      ),
                                      width: 40,
                                      height: 40,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 40),
                                    const BodyMedium(
                                      data: "Klasör Ekle",
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ),
                          const Spacer()
                        ],
                      ))
                ],
              ),
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  CustomAppBar itemsappbar(BuildContext context) {
    return CustomAppBar(
        label: "Malzemeler",
        leadingWidth: 50,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const DashboardSvgIcon(file: "search.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: const DashboardSvgIcon(file: "qr_code.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: const DashboardSvgIcon(file: "ellipsis.svg"),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Transform.rotate(
              angle: 1.6, child: const DashboardSvgIcon(file: "sitemap.svg")),
        ),
        context: context);
  }
}
