import 'package:aden/core/route/route_generator.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/core/widgets/custom_svg_icon.dart';
import 'package:aden/feature/project/widgets/add_text_file.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:aden/feature/root/widgets/folder_without_arrow_down.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';

class CreateItemsView extends StatefulWidget {
  const CreateItemsView({Key? key}) : super(key: key);

  @override
  State<CreateItemsView> createState() => _CreateItemsViewState();
}

class _CreateItemsViewState extends State<CreateItemsView> {
  late TextEditingController totalvaluecontroller;
  late TextEditingController quantitycontroller;
  late TextEditingController pricecontroller;

  @override
  void initState() {
    totalvaluecontroller = TextEditingController();
    quantitycontroller = TextEditingController();
    pricecontroller = TextEditingController();
    totalvaluecontroller.text = "0";
    pricecontroller.text = "0";
    quantitycontroller.text = "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: null,
              child: Text(
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: context.colorScheme.background,
              height: context.dynamicHeight(.26),
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
                              totalvaluecontroller.text =
                                  (double.parse(pricecontroller.text) *
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
                            if (int.parse(value) >= 0) {
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
                          keyboardType: TextInputType.number,
                          style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.onSurface
                                  .withOpacity(.5)),
                          onFieldSubmitted: (value) {
                            setState(() {
                              totalvaluecontroller.text =
                                  (double.parse(pricecontroller.text) *
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
                        child: TextField(
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
                    onTap: () {
                      context.router.push(const AddTagRoute());
                    },
                    trailing: const Icon(Icons.arrow_right),
                    title: const BodyMedium(data: "Etiketler"),
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
                    onTap: () {
                      context.router.push(const AddNoteRoute());
                    },
                    trailing: const Icon(Icons.arrow_right),
                    title: const BodyMedium(data: "Notlar"),
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
      )),
    );
  }
}
