import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class SyncInventroyView extends StatelessWidget {
  const SyncInventroyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      SingleChildScrollView(child: Column(
        children: [
          
        ],
      ),)),
      appBar: CustomAppBar(
        label: "Senkronize Envanter",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        autoImplicity: true,
        context: context,
      ),
    );
  }
}
