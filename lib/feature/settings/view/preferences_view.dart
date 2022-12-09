import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/settings/model/notification_preferences_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Tercihler",
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
          crossAxisAlignment : CrossAxisAlignment.start,
          children: <Widget>[
            BodyLarge(
              data: "Bildiri Tercihi",
              color: context.colorScheme.onSurface.withOpacity(.6),
              fontweight: FontWeight.bold,
            ),
            const SizedBox(height:20),
            
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      
                    },
                    trailing: Switch(value: true, onChanged:(value) {
                      
                    },),
                    contentPadding: EdgeInsets.zero,
                    title:
                        BodyMedium(data: notificationPreferences[index].name),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.3),
                  );
                },
                itemCount: notificationPreferences.length)
          ],
        ),
      )),
    );
  }
}
