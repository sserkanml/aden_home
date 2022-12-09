import 'package:aden/core/util/extension.dart';
import 'package:aden/feature/root/widgets/dashboard_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';

class ManageTagView extends StatelessWidget {
  const ManageTagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: context.paddingAll(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                hintText: "Arama Yap",
                                fillColor: context.colorScheme.background,
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(Icons.search),
                                contentPadding: EdgeInsets.zero),
                          ))),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
      appBar: CustomAppBar(
        label: "Etiketler",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const DashboardSvgIcon(file: "pen.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: const DashboardSvgIcon(file: "plus.svg"),
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
    );
  }
}
