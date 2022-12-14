import 'dart:io';

import 'package:aden/core/route/route_generator.dart';
import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/util/extension.dart';
import 'package:aden/core/view_model/show_bottom_sheet.dart';
import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/items/widgets/items_summary_info.dart';
import 'package:aden/feature/project/mobx/folder_mobx.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:nine_grid_view/nine_grid_view.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: itemsappbar(context),
      floatingActionButton: itemsfloatingactionbutton(context),
      body: SafeArea(
          child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(15),
              color: context.colorScheme.background,
              child: const ItemsSummaryInfo()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bar_chart_sharp),
              ),
            ],
          ),
          Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, outer) {
                    return Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            NineGridView(
                              width: 150,
                              margin: const EdgeInsets.all(4),
                              itemCount: 4,
                              space: 10,
                              itemBuilder: (context, index) {
                                return DependecyService.getIt
                                            .get<FolderMobx>()
                                            .folders[outer]
                                            .images
                                            .length >
                                        index
                                    ? Image.file(
                                        File(
                                          DependecyService.getIt
                                              .get<FolderMobx>()
                                              .folders[outer]
                                              .images[index],
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/images/file_default.png');
                              },
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      BodyMedium(
                                        data: DependecyService.getIt
                                            .get<FolderMobx>()
                                            .folders[outer]
                                            .id_folder
                                            .substring(0, 8),
                                        color: context.colorScheme.onSurface
                                            .withOpacity(.4),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      BodyLarge(
                                          data: DependecyService.getIt
                                              .get<FolderMobx>()
                                              .folders[outer]
                                              .name),
                                    ],
                                  ),
                                  const DashboardSvgIcon(file: "ellipsis.svg"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0,
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    );
                  },
                  itemCount:
                      DependecyService.getIt.get<FolderMobx>().folders.length))
        ],
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
                          const Spacer(),
                          SizedBox(
                            width: context.dynamicWidth(1),
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () async {
                                  await context.router
                                      .push(const CreateItemsRoute());
                                  Future.delayed(
                                      const Duration(milliseconds: 300), () {
                                    Navigator.pop(context);
                                  });
                                },
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
                                    const Spacer(),
                                    const BodyMedium(
                                      data: "Malzeme Ekle",
                                      color: Colors.white,
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: context.dynamicWidth(1),
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () async {
                                  await context.router
                                      .push(const CreateFolderRoute());
                                  Future.delayed(
                                      const Duration(milliseconds: 300), () {
                                    Navigator.pop(context);
                                  });
                                },
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
                                    const Spacer(),
                                    const BodyMedium(
                                      data: "Klasör Ekle",
                                      color: Colors.white,
                                    ),
                                    const Spacer(),
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
            onPressed: () {
              ShowBottomSheet.ellipsisBottomSheet(context: context);
            },
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
