import 'package:aden/core/route/route_generator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/custom_svg_icon.dart';
import '../../root/widgets/dashboard_svg_icon.dart';
import '../../root/widgets/folder_without_arrow_down.dart';
import '../model/tags_model.dart';
import '../widgets/add_text_file.dart';

class CreateFolderView extends StatefulWidget {
  const CreateFolderView({Key? key}) : super(key: key);

  @override
  State<CreateFolderView> createState() => _CreateFolderViewState();
}

class _CreateFolderViewState extends State<CreateFolderView> {
  late List<TagsModel>? selectedTagsList;
  late String? notes;
  @override
  void initState() {
    selectedTagsList = [];
    notes = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions:  [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: () {
                
              },
              child: Text(
                "Kaydet",
              ),
            ),
          ),
        ],
        label: "Klasör Oluştur",
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: context.colorScheme.background,
              height: context.dynamicHeight(.35),
              width: context.dynamicWidth(1),
              child: DottedBorder(
                dashPattern: const [10, 15],
                color: context.colorScheme.onSurface.withOpacity(.5),
                child: SizedBox(
                  width: context.dynamicWidth(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSvgIcon(
                        file: "addpicture.svg",
                        size: 45,
                        color: context.colorScheme.onSurface.withOpacity(.3),
                      ),
                      const SizedBox(height: 10),
                      BodyMedium(
                        data: "Resim Ekle",
                        color: context.colorScheme.onSurface.withOpacity(.3),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  FolderWithoutArrowDown(
                      file: "folder_solid.svg", data: "Malzeme"),
                  ItemAddTextField(hintText: "Klasör Ekle")
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              color: context.colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    onTap: () async {
                      selectedTagsList = await context.router
                          .push<List<TagsModel>?>(
                              AddTagRoute(tagsList: selectedTagsList));

                      setState(() {});
                    },
                    subtitle: (selectedTagsList?.length ?? 0) == 0
                        ? null
                        : Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              height: 40,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: selectedTagsList!.map<Widget>((e) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 10),
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
                                                color:
                                                    context.colorScheme.primary,
                                                fontWeight: FontWeight.bold),
                                        backgroundColor: context
                                            .colorScheme.primary
                                            .withOpacity(.3),
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                    trailing: const Icon(Icons.arrow_right),
                    title: const BodyMedium(data: "Etiketler"),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 0.0,
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.1),
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
                    color: context.colorScheme.onSurface.withOpacity(.1),
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
      )),
    );
  }
}
