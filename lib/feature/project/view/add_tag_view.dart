import 'package:aden/core/widgets/bodymedium.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../core/widgets/appbar.dart';

class AddTagView extends StatefulWidget {
  const AddTagView({Key? key}) : super(key: key);

  @override
  State<AddTagView> createState() => _AddTagViewState();
}

class _AddTagViewState extends State<AddTagView> {
  late TextfieldTagsController controller;
  late double _distanceToField;
  @override
  void initState() {
    super.initState();
    controller = TextfieldTagsController();
  }

  @override
  void didChangeDependencies() {
    _distanceToField = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        label: "Etiketler",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        autoImplicity: true,
        context: context,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldTags(
              textfieldTagsController: controller,
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              validator: (String tag) {
                bool? isContaning = controller.getTags?.contains(tag);
                if (isContaning ?? false) {
                  return '$tag zaten var';
                } else if (controller.getTags!.length > 3) {
                  return "Maksimum Etiket Sayısına Ulaşıldı";
                }

                return null;
              },
              inputfieldBuilder:
                  (context, tec, fn, error, onChanged, onSubmitted) {
                return ((context, sc, tags, onTagDelete) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.onSurface.withOpacity(.7)),
                      controller: tec,
                      focusNode: fn,
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 74, 137, 92),
                            width: 3.0,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 74, 137, 92),
                            width: 3.0,
                          ),
                        ),
                        hintText: controller.hasTags ? '' : "Etiket Gir...",
                        errorText: error,
                        prefixIconConstraints:
                            BoxConstraints(maxWidth: _distanceToField * 0.74),
                        prefixIcon: tags.isNotEmpty
                            ? SingleChildScrollView(
                                controller: sc,
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: tags.map((String tag) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: Color.fromARGB(255, 74, 137, 92),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            '#$tag',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          onTap: () {
                                            //print("$tag selected");
                                          },
                                        ),
                                        const SizedBox(width: 4.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 14.0,
                                            color: Color.fromARGB(
                                                255, 233, 233, 233),
                                          ),
                                          onTap: () {
                                            onTagDelete(tag);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }).toList()),
                              )
                            : null,
                      ),
                      onChanged: onChanged,
                      onFieldSubmitted: onSubmitted,
                    ),
                  );
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BodyMedium(
              data: "Mevcut Etiketler",
              color: context.colorScheme.onSurface.withOpacity(.3),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: context.colorScheme.onSurface.withOpacity(.3),
                      );
                    },
                    itemCount: 10))
          ],
        ),
      ),
    );
  }
}
