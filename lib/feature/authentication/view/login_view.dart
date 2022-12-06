import 'package:aden/core/widgets/appbar.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: "Giriş Yap", context: context),
    );
  }
}
