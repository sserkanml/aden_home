import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constant/path_constant.dart';
import '../../../core/widgets/bodylarge.dart';
import '../../../core/widgets/bodymedium.dart';
import '../../../core/widgets/textfield.dart';
import '../widgets/postioned_bottom.dart';
import '../widgets/svg_picture_suffix.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isClickPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: "Giriş Yap", context: context),
      body: Stack(
        children: [
          Positioned.fill(
              bottom: 70,
              left: 0,
              top: 0,
              right: 0,
              child: Center(
                child: SingleChildScrollView(
                  padding: context.paddingAll(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BodyLarge(
                        data: "Tekrardan Hoşgeldin !",
                        fontweight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      const BodyMedium(data: "Uygulamaya Giriş Yapabilirsin"),
                      const SizedBox(height: 20),
                      const CustomTextFormField(
                        labelText: "Email",
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        obscureText: isClickPassword ? true : false,
                        labelText: "Şifre",
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isClickPassword = !isClickPassword;
                            });
                          },
                          icon: SvgPictureSuffix(
                              file: isClickPassword
                                  ? "eye.svg"
                                  : "eye_close.svg"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BodyMedium(
                        data: "Şifremi Unuttum ?",
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: context.dynamicWidth(1),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Giriş Yap",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              height: 70,
              bottom: 0,
              left: 0,
              right: 0,
              child: PositionedBottom(
                  child: Center(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Henüz bir hesabın yok mu ? ",
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: context.colorScheme.onSurface)),
                  TextSpan(
                      text: "Kayıt Ol",
                      recognizer: TapGestureRecognizer()..onTap = () {
                         context.router.pushNamed(PathConstant.signupPath);
                      },
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: context.colorScheme.primary)),
                ])),
              )))
        ],
      ),
    );
  }
}
