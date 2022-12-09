import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:flutter/material.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: ElevatedButton(onPressed: null, child: BodyLarge(data: "Kaydet")),
            ),
          ],
          label: "Şifre Belirle",
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
          context: context),
    );
  }
}
