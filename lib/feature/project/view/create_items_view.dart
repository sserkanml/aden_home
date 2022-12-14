import 'dart:io';

import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/project/model/tags_model.dart';
import 'package:aden/feature/project/view_model/items_formr.dart';

import 'package:aden/feature/project/widgets/add_text_file.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:aden/feature/root/widgets/folder_without_arrow_down.dart';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../../../core/route/route_generator.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/custom_svg_icon.dart';
import '../model/images_managment.dart';
import '../view_model/images_picker.dart';

class CreateItemsView extends StatefulWidget {
  const CreateItemsView({Key? key}) : super(key: key);

  @override
  State<CreateItemsView> createState() => _CreateItemsViewState();
}

class _CreateItemsViewState extends State<CreateItemsView> {
  late TextEditingController totalvaluecontroller;
  late TextEditingController quantitycontroller;
  late TextEditingController pricecontroller;
  late List<TagsModel>? selectedTagsList;
  late String? notes;

  int currentPageIndex = 0;

  @override
  void initState() {
    totalvaluecontroller = TextEditingController();
    quantitycontroller = TextEditingController();
    pricecontroller = TextEditingController();
    selectedTagsList = [];

    notes = "";
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    ImageManagmentService.GenerateImagePicker(() {});
  }

  @override
  void dispose() {
    super.dispose();
    ImageManagmentService.imageModelCopy = [];
    ImageManagmentService.imageModel = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: () {
                FormItems.formItems.currentState?.validate();
              },
              child: const Text(
                "Kaydet",
              ),
            ),
          ),
        ],
        label: "Malzeme Olu??tur",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        autoImplicity: true,
        context: context,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: FormItems.formItems,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  color: context.colorScheme.background,
                  height: context.dynamicHeight(.34),
                  width: context.dynamicWidth(1),
                  child: InkWell(
                    onTap: () async {
                      await ImageManagmentService.GenerateImagePicker(() {});
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, customSetState) {
                                return Material(
                                  child: SizedBox(
                                    height: context.dynamicHeight(.8),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            height: 40,
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 8.0),
                                                    child: BodyLarge(
                                                        data: "Se??ilen Resim"),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      if (ImageManagmentService
                                                          .imageModel.isEmpty) {
                                                        for (var element
                                                            in ImageManagmentService
                                                                .imageModelCopy) {
                                                          element.isSelected =
                                                              false;
                                                        }
                                                        setState(() {});
                                                      } else {
                                                        ImageManagmentService
                                                            .takeBack();
                                                        setState(() {});
                                                      }
                                                    },
                                                    icon:
                                                        const Icon(Icons.close),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Positioned.fill(
                                            bottom: 70,
                                            top: 50,
                                            right: 0,
                                            left: 0,
                                            child: NotificationListener<
                                                ScrollNotification>(
                                              onNotification: (notification) {
                                                return ImageManagmentService
                                                    .handleScrollEvent(
                                                        notification, () {
                                                  setState(() {
                                                    ImageManagmentService
                                                        .currentPage++;
                                                  });
                                                });
                                              },
                                              child: GridView.builder(
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 4,
                                                        crossAxisSpacing: 5,
                                                        mainAxisSpacing: 5),
                                                itemCount: ImageManagmentService
                                                    .entites.length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                      onTap: () async {
                                                        if (ImageManagmentService
                                                                .imageModelCopy
                                                                .where((element) =>
                                                                    element
                                                                        .isSelected ==
                                                                    true)
                                                                .length ==
                                                            4) {
                                                          if (ImageManagmentService
                                                              .imageModelCopy[
                                                                  index]
                                                              .isSelected) {
                                                            ImageManagmentService
                                                                .imageModelCopy[
                                                                    index]
                                                                .isSelected = false;
                                                          }
                                                        } else {
                                                          if (ImageManagmentService
                                                              .imageModelCopy[
                                                                  index]
                                                              .isSelected) {
                                                            ImageManagmentService
                                                                .imageModelCopy[
                                                                    index]
                                                                .isSelected = false;
                                                          } else {
                                                            ImageManagmentService
                                                                .imageModelCopy[
                                                                    index]
                                                                .isSelected = true;
                                                          }
                                                        }

                                                        customSetState(
                                                          () {},
                                                        );
                                                      },
                                                      child: ImageManagmentService
                                                              .imageModelCopy
                                                              .isEmpty
                                                          ? AssetEntityImage(
                                                              ImageManagmentService
                                                                      .entites[
                                                                  index],
                                                              fit: BoxFit.cover,
                                                            )
                                                          : ImageManagmentService
                                                                  .imageModelCopy[
                                                                      index]
                                                                  .isSelected
                                                              ? Stack(
                                                                  children: [
                                                                    Positioned
                                                                        .fill(
                                                                      child:
                                                                          AssetEntityImage(
                                                                        ImageManagmentService
                                                                            .entites[index],
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      color: context
                                                                          .colorScheme
                                                                          .onSurface
                                                                          .withOpacity(
                                                                              .3),
                                                                      child:
                                                                          const Center(
                                                                        child: Icon(
                                                                            Icons.check_rounded),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              : AssetEntityImage(
                                                                  ImageManagmentService
                                                                          .entites[
                                                                      index],
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ));
                                                },
                                              ),
                                            )),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          height: 70,
                                          child: Padding(
                                            padding: context.paddingAll(),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: SizedBox(
                                                    height: context
                                                        .dynamicHeight(1),
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          ImageManagmentService
                                                              .saveImageModel();
                                                          setState(() {});
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const BodyMedium(
                                                          data: "Se??",
                                                        )),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                SizedBox(
                                                  height:
                                                      context.dynamicHeight(1),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      final AssetEntity?
                                                          entity =
                                                          await CameraPicker
                                                              .pickFromCamera(
                                                        context,
                                                        pickerConfig:
                                                            CameraPickerConfig(
                                                                textDelegate:
                                                                    CustomCameraPickerDelegate()),
                                                      );
                                                      if (entity == null) {
                                                        return;
                                                      } else {
                                                        ImageManagmentService
                                                            .entites
                                                            .add(entity);
                                                        customSetState(() {});
                                                      }
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  5)),
                                                      child: Container(
                                                        color: Colors.blue,
                                                        width: 40,
                                                        height: 40,
                                                        child: const Center(
                                                          child: Icon(Icons
                                                              .camera_enhance),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        color: context.colorScheme.background,
                        height: context.dynamicHeight(.35),
                        width: context.dynamicWidth(1),
                        child: ImageManagmentService.imageModel.isEmpty
                            ? DottedBorder(
                                dashPattern: const [10, 15],
                                color: context.colorScheme.onSurface
                                    .withOpacity(.5),
                                child: SizedBox(
                                  width: context.dynamicWidth(1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomSvgIcon(
                                        file: "addpicture.svg",
                                        size: 45,
                                        color: context.colorScheme.onSurface
                                            .withOpacity(.3),
                                      ),
                                      const SizedBox(height: 10),
                                      BodyMedium(
                                        data: "Resim Ekle",
                                        color: context.colorScheme.onSurface
                                            .withOpacity(.3),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : PageView.builder(
                                itemBuilder: (context, index) {
                                  return ImageManagmentService
                                              .imageModel.length >
                                          index
                                      ? Image.file(
                                          File(ImageManagmentService
                                              .imageModel[index].path),
                                          fit: BoxFit.cover,
                                        )
                                      : SizedBox(
                                          width: context.dynamicWidth(1),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomSvgIcon(
                                                file: "addpicture.svg",
                                                size: 45,
                                                color: context
                                                    .colorScheme.onSurface
                                                    .withOpacity(.3),
                                              ),
                                              const SizedBox(height: 10),
                                              BodyMedium(
                                                data: "Resim Ekle",
                                                color: context
                                                    .colorScheme.onSurface
                                                    .withOpacity(.3),
                                              )
                                            ],
                                          ),
                                        );
                                },
                                itemCount: 4,
                              )),
                  )),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    FolderWithoutArrowDown(
                        file: "folder_solid.svg", data: "Malzeme"),
                    ItemAddTextField(hintText: "Malzeme Ekle")
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: context.colorScheme.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (value) {
                              setState(() {
                                totalvaluecontroller.text = (double.parse(
                                            pricecontroller.text) *
                                        double.parse(quantitycontroller.text))
                                    .toString();
                              });
                            },
                            controller: pricecontroller,
                            style: context.textTheme.bodyMedium!.copyWith(
                                color: context.colorScheme.onSurface
                                    .withOpacity(.5)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bu alan bo?? ge??ilemez";
                              }
                              if (int.parse(value) <= 0) {
                                return "Ge??ersiz Miktar";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                labelText: "Miktar"),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: context.textTheme.bodyMedium!.copyWith(
                                color: context.colorScheme.onSurface
                                    .withOpacity(.5)),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                labelText: "Min Seviye"),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bu alan bo?? ge??ilemez";
                              }
                              if (int.parse(value) <= 0) {
                                return "Ge??ersiz Miktar";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            style: context.textTheme.bodyMedium!.copyWith(
                                color: context.colorScheme.onSurface
                                    .withOpacity(.5)),
                            onFieldSubmitted: (value) {
                              setState(() {
                                totalvaluecontroller.text = (double.parse(
                                            pricecontroller.text) *
                                        double.parse(quantitycontroller.text))
                                    .toString();
                              });
                            },
                            controller: quantitycontroller,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                labelText: "Fiyat"),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bu alan bo?? ge??ilemez";
                              } else {
                                return null;
                              }
                            },
                            style: context.textTheme.bodyMedium!.copyWith(
                                color: context.colorScheme.onSurface
                                    .withOpacity(.5)),
                            controller: totalvaluecontroller,
                            readOnly: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                labelText: "Toplam Tutar"),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      height: 0,
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      onTap: () async {
                        selectedTagsList = await context.router
                            .push<List<TagsModel>?>(
                                AddTagRoute(tagsList: selectedTagsList));

                        setState(() {});
                      },
                      trailing: const Icon(Icons.arrow_right),
                      title: const BodyMedium(data: "Etiketler"),
                      subtitle: (selectedTagsList?.length ?? 0) == 0
                          ? null
                          : Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                height: 40,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children:
                                        selectedTagsList!.map<Widget>((e) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: InputChip(
                                          // selected: _selected[i],
                                          label: Text(e.name),

                                          elevation: 0,
                                          pressElevation: 0,
                                          selected: true,
                                          padding: const EdgeInsets.all(5),
                                          labelStyle: context
                                              .textTheme.bodyMedium!
                                              .copyWith(
                                                  color: context
                                                      .colorScheme.primary,
                                                  fontWeight: FontWeight.bold),
                                          backgroundColor: context
                                              .colorScheme.primary
                                              .withOpacity(.3),
                                        ),
                                      );
                                    }).toList()),
                              ),
                            ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0.0,
                      ),
                    ),
                    Divider(
                      height: 0,
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    ),
                    ListTile(
                      onTap: () async {
                        notes = await context.router
                            .push<String?>(AddNoteRoute(getNotes: notes));
                        setState(() {});
                      },
                      trailing: const Icon(Icons.arrow_right),
                      title: const BodyMedium(data: "Notlar"),
                      subtitle: BodyMedium(
                          data: notes ?? "",
                          color: context.colorScheme.onSurface.withOpacity(.4)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0.0,
                      ),
                    ),
                    Divider(
                      height: 0,
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    ),
                    const SizedBox(height: 20),
                    BodyLarge(
                      data: "QR/Barkod",
                      color: context.colorScheme.onSurface.withOpacity(.7),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: context.dynamicWidth(1),
                      height: 50,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: const [
                              DashboardSvgIcon(file: "qr_code.svg"),
                              Spacer(),
                              BodyMedium(data: "Qr/Barkod ile Ba??la"),
                              Spacer(),
                            ],
                          )),
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      height: 0,
                      color: context.colorScheme.onSurface.withOpacity(.3),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        context.router.push(const CustomFieldRoute());
                      },
                      child: const Text(
                        "??zel Alan Ekle",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
