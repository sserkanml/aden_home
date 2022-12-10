import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({Key? key}) : super(key: key);

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Notlar",
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
          child: SingleChildScrollView(
        padding: context.paddingAll(),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Not Yaz"),
            )
          ],
        ),
      )),
    );
  }
}
