import 'package:aden/core/util/extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';

class AddNoteView extends StatefulWidget {
  final String? getNotes;
  const AddNoteView({Key? key, this.getNotes}) : super(key: key);

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = widget.getNotes ?? " ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Notlar",
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: controller.text == widget.getNotes
                  ? null
                  : () {
                      context.router.pop<String?>(controller.text);
                    },
              child: const Text(
                "Kaydet",
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            context.router.pop<String?>(widget.getNotes);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        autoImplicity: true,
        context: context,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: context.paddingAll(),
        child: Column(
          children: [
            TextFormField(
              style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.onSurface.withOpacity(.7)),
              controller: controller,
              onChanged: (value) {
                setState(() {});
              },
              decoration: const InputDecoration(hintText: "Not Yaz"),
            )
          ],
        ),
      )),
    );
  }
}
