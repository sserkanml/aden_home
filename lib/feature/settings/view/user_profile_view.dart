import 'package:aden/core/route/route_generator.dart';
import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/core/widgets/headline6.dart';
import 'package:aden/core/widgets/textfield.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Kullanıcı Profili",
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
            const CustomTextFormField(labelText: "İsim"),
            const SizedBox(height: 20),
            const CustomTextFormField(labelText: "Email"),
            const SizedBox(height: 20),
            const CustomTextFormField(labelText: "Telefon Numarası"),
            const SizedBox(height: 30),
            BodyLarge(
              data: "Şifre Değiştirme",
              color: context.colorScheme.onSurface.withOpacity(.5),
              fontweight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: context.dynamicWidth(1),
              height: 50,
              child: TextButton(
                  onPressed: () {
                    context.router.push(const SetPasswordRoute());
                  },
                  child: const BodyMedium(data: "Şifre Değiştir")),
            ),
          ],
        ),
      )),
    );
  }
}
