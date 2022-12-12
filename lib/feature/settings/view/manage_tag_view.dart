import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/feature/project/model/tags_mobx.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bodymedium.dart';

class ManageTagView extends StatefulWidget {
  const ManageTagView({Key? key}) : super(key: key);

  @override
  State<ManageTagView> createState() => _ManageTagViewState();
}

class _ManageTagViewState extends State<ManageTagView> {
  bool isEditting = false;
  late TextEditingController tagscontroller;
  late TextEditingController tagsrenamecontroller;

  @override
  void initState() {
    tagscontroller = TextEditingController();
    tagsrenamecontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tagscontroller.dispose();
    tagsrenamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: context.paddingAll(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                hintText: "Arama Yap",
                                fillColor: context.colorScheme.background,
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(Icons.search),
                                contentPadding: EdgeInsets.zero),
                          ))),
                  Observer(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          DependecyService.getIt.get<TagsMobx>().sortTags();
                        },
                        icon: Icon(
                          Icons.sort,
                          color: DependecyService.getIt.get<TagsMobx>().isSorted
                              ? Colors.red
                              : context.colorScheme.onSurface,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: Observer(builder: (_) {
              return ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: isEditting
                          ? IconButton(
                              onPressed: () {
                                DependecyService.getIt
                                    .get<TagsMobx>()
                                    .deleteTag(
                                        name: DependecyService.getIt
                                            .get<TagsMobx>()
                                            .copyModels[index]
                                            .name);
                              },
                              icon: const Icon(Icons.delete),
                            )
                          : IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_right),
                            ),
                      onTap: () async {
                        tagsrenamecontroller.text = DependecyService.getIt
                            .get<TagsMobx>()
                            .copyModels[index]
                            .name;

                        if (isEditting) {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const BodyLarge(
                                    data: "Etiket Yeniden Adlandır"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const BodyMedium(
                                        data:
                                            "Harfler ve sayılara izin verilir.Özel Karakterlere izin verilmez"),
                                    TextField(
                                      controller: tagsrenamecontroller,
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                              color: context
                                                  .colorScheme.onSurface),
                                      decoration: const InputDecoration(
                                          labelText: "Etiket İsmi"),
                                    )
                                  ],
                                ),
                                actions: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            tagscontroller.text = '';
                                          },
                                          child: const BodyMedium(
                                            data: "İptal",
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 5,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.green.shade200),
                                          onPressed: () {
                                            if (DependecyService.getIt
                                                    .get<TagsMobx>()
                                                    .copyModels[index]
                                                    .name !=
                                                tagsrenamecontroller.text) {
                                              DependecyService.getIt
                                                  .get<TagsMobx>()
                                                  .updateTags(
                                                      value:
                                                          tagsrenamecontroller
                                                              .text,
                                                      id: DependecyService.getIt
                                                          .get<TagsMobx>()
                                                          .copyModels[index]
                                                          .tags_id);

                                              Navigator.pop(context);
                                              tagscontroller.text = '';
                                            } else {
                                              return;
                                            }
                                          },
                                          child: const BodyMedium(
                                            data: "Kaydet",
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                          Future.delayed(const Duration(milliseconds: 100), () {
                            setState(() {});
                          });
                        } else {}
                      },
                      title: BodyMedium(
                          data: DependecyService.getIt
                              .get<TagsMobx>()
                              .copyModels[index]
                              .name),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0,
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    );
                  },
                  itemCount:
                      DependecyService.getIt.get<TagsMobx>().copyModels.length);
            }))
          ],
        ),
        appBar: isEditting
            ? CustomAppBar(
                label: "Etiket Düzenle",
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isEditting = false;
                        });
                        DependecyService.getIt
                            .get<TagsMobx>()
                            .deleteTagOriginal(DependecyService.getIt
                                .get<TagsMobx>()
                                .tags_name_deleted);
                        DependecyService.getIt
                            .get<TagsMobx>()
                            .updateTagOriginal(
                                DependecyService.getIt
                                    .get<TagsMobx>()
                                    .tags_name_updated,
                                DependecyService.getIt
                                    .get<TagsMobx>()
                                    .tags_name_updated_value);
                      },
                      child: const Text(
                        "Tamamla",
                      ),
                    ),
                  ),
                ],
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      isEditting = false;
                    });
                    DependecyService.getIt.get<TagsMobx>().takeBack();
                  },
                  icon: const Icon(Icons.close),
                ),
                autoImplicity: true,
                context: context,
              )
            : CustomAppBar(
                label: "Etiketler",
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isEditting = true;
                      });
                    },
                    icon: const DashboardSvgIcon(file: "pen.svg"),
                  ),
                  IconButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const BodyLarge(data: "Etiket Ekle"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const BodyMedium(
                                    data:
                                        "Harfler ve sayılara izin verilir.Özel Karakterlere izin verilmez"),
                                TextField(
                                  controller: tagscontroller,
                                  style: context.textTheme.bodyMedium!.copyWith(
                                      color: context.colorScheme.onSurface),
                                  decoration: const InputDecoration(
                                      labelText: "Etiket İsmi"),
                                )
                              ],
                            ),
                            actions: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        tagscontroller.text = '';
                                      },
                                      child: const BodyMedium(
                                        data: "İptal",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    flex: 5,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.green.shade200),
                                      onPressed: () {
                                        if (tagscontroller.text.isNotEmpty) {
                                          DependecyService.getIt
                                              .get<TagsMobx>()
                                              .createTag(
                                                  name: tagscontroller.text);
                                          Navigator.pop(context);
                                          tagscontroller.text = '';
                                        } else {
                                          return;
                                        }
                                      },
                                      child: const BodyMedium(
                                        data: "Kaydet",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                      Future.delayed(const Duration(milliseconds: 100), () {
                        setState(() {});
                      });
                    },
                    icon: const DashboardSvgIcon(file: "plus.svg"),
                  ),
                ],
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                autoImplicity: true,
                context: context,
              ));
  }
}
