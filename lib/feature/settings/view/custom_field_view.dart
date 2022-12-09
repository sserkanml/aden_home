import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class CustomFieldView extends StatelessWidget {
  const CustomFieldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Özel Input Ekle",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        autoImplicity: true,
        context: context,
      ),
    );
  }
}
