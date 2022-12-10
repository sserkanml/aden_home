import 'package:aden/core/util/extension.dart';
import 'package:aden/feature/settings/model/help_support_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bodymedium.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BodyMedium(
              data: "Yardım Merkezi",
              color: context.colorScheme.onSurface.withOpacity(.5),
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return index == 3
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            BodyMedium(
                              data: "Yasal",
                              color:
                                  context.colorScheme.onSurface.withOpacity(.5),
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 20),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () {},
                              title:
                                  BodyMedium(data: helpsupportdata[index].name),
                            )
                          ],
                        )
                      : ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () {},
                          title: BodyMedium(data: helpsupportdata[index].name),
                        );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.3),
                  );
                },
                itemCount: helpsupportdata.length)
          ],
        ),
      )),
    );
  }
}
