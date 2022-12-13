import 'dart:io';

import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/core/widgets/custom_svg_icon.dart';
import 'package:aden/feature/project/model/tags_model.dart';
import 'package:aden/feature/project/view_model/items_formr.dart';

import 'package:aden/feature/project/widgets/add_text_file.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:aden/feature/root/widgets/folder_without_arrow_down.dart';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../../../core/route/route_generator.dart';
import '../../../core/widgets/appbar.dart';
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
  late List<AssetEntity>? selectedImage;
  late List<String> pathName;
  int currentPageIndex = 0;

  @override
  void initState() {
    totalvaluecontroller = TextEditingController();
    quantitycontroller = TextEditingController();
    pricecontroller = TextEditingController();
    selectedTagsList = [];
    selectedImage = [];
    pathName = [];

    notes = "";
    super.initState();
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
        label: "Malzeme Oluştur",
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
                        selectedImage = await AssetPicker.pickAssets(
                          context,
                          pickerConfig: AssetPickerConfig(
                            maxAssets: 4,
                            textDelegate: ImagePickerTextDelegate(),
                            selectedAssets: selectedImage,
                            specialItemPosition: SpecialItemPosition.prepend,
                            specialItemBuilder: (
                              BuildContext context,
                              AssetPathEntity? path,
                              int length,
                            ) {
                              if (path?.isAll != true) {
                                return null;
                              }

                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  Feedback.forTap(context);
                                  AssetEntity? result;
                                  if (selectedImage?.length == 4) {
                                  } else {
                                    result = await CameraPicker.pickFromCamera(
                                      context,
                                      pickerConfig: CameraPickerConfig(
                                          enableRecording: false,
                                          textDelegate:
                                              CustomCameraPickerDelegate()),
                                    );
                                  }

                                  if (result != null) {
                                    (BuildContext context,
                                            AssetEntity result) =>
                                        selectedImage?.add(result);

                                    Navigator.of(context).pop(<AssetEntity>[
                                      ...?selectedImage,
                                      result
                                    ]);
                                  }
                                },
                                child: const Center(
                                  child: Icon(Icons.camera_enhance, size: 42.0),
                                ),
                              );
                            },
                          ),
                        );
                        bool firstTimeClear = true;
                        selectedImage?.forEach(
                          (element) async {
                            if (firstTimeClear) {
                              pathName.clear();
                              firstTimeClear = false;
                            }
                            final file = await element.file;
                            final String result = file!.path;
                            pathName.add(result);
                            setState(() {});
                          },
                        );
                        setState(() {});
                      },
                      // ignore: prefer_is_empty
                      child: selectedImage?.length == 0
                          ? DottedBorder(
                              dashPattern: const [10, 15],
                              color:
                                  context.colorScheme.onSurface.withOpacity(.5),
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
                              onPageChanged: (value) {
                                setState(() {
                                  currentPageIndex = value;
                                });
                              },
                              itemBuilder: (context, index) {
                                return (pathName.length) - 1 >= index
                                    ? Image.file(
                                        File(
                                          pathName[index],
                                        ),
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
                            ))),
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
                                return "Bu alan boş geçilemez";
                              }
                              if (int.parse(value) <= 0) {
                                return "Geçersiz Miktar";
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
                                return "Bu alan boş geçilemez";
                              }
                              if (int.parse(value) <= 0) {
                                return "Geçersiz Miktar";
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
                                return "Bu alan boş geçilemez";
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
                              BodyMedium(data: "Qr/Barkod ile Bağla"),
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
                        "Özel Alan Ekle",
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
