import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Yardım & Destek",
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
          children: const <Widget>[],
        ),
      )),
    );
  }
}
