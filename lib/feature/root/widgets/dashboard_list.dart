import 'dart:io';

import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/feature/project/mobx/folder_mobx.dart';
import 'package:aden/feature/root/widgets/dashboard_list_no_item.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import 'dashboard_svg_icon.dart';

class DashboardList extends StatelessWidget {
  const DashboardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      height: context.dynamicHeight(.34),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 170,
            child: InkWell(
              onTap: () async {},
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 1,
                margin: const EdgeInsets.only(right: 10),
                child: DependecyService.getIt.get<FolderMobx>().folders.length >
                        index
                    ? Column(
                        children: [
                          if (DependecyService.getIt
                              .get<FolderMobx>()
                              .images
                              .isEmpty)
                            Expanded(
                              flex: 2,
                              child:
                                  Image.asset('assets/images/file_default.png',color: context.colorScheme.onSurface,),
                            )
                          else
                            Expanded(
                              flex: 2,
                              child: Image.file(
                                File(
                                  DependecyService.getIt
                                      .get<FolderMobx>()
                                      .images[0],
                                ),
                                width: context.dynamicWidth(1),
                                fit: BoxFit.cover,
                              ),
                            ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BodyMedium(
                                        data: DependecyService.getIt
                                            .get<FolderMobx>()
                                            .folders[index]
                                            .id_folder
                                            .substring(0, 8),
                                        color: context.colorScheme.onSurface
                                            .withOpacity(.4),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      BodyLarge(
                                          data: DependecyService.getIt
                                              .get<FolderMobx>()
                                              .folders[index]
                                              .name),
                                    ],
                                  ),
                                  const DashboardSvgIcon(file: "ellipsis.svg"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const DashboardListNoItem(),
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
