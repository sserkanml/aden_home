import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:aden/core/widgets/textfield.dart';
import 'package:aden/feature/authentication/widgets/postioned_bottom.dart';
import 'package:aden/feature/authentication/widgets/svg_picture_suffix.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constant/path_constant.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isClickCheckbox = false;
  bool isClickPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: "Kayıt Ol", context: context,autoImplicity: true,),
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
                        data: "Bir Hesap Oluştur !",
                        fontweight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      const BodyMedium(
                          data: "Bugün bir hesap oluşturarak başlayabilirsin"),
                      const SizedBox(height: 20),
                      const CustomTextFormField(labelText: "Ad Soyad"),
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
                      FormField(
                        builder: (field) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: isClickCheckbox,
                                    onChanged: (value) {
                                      setState(() {
                                        isClickCheckbox = !isClickCheckbox;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "Kullanıcı sözleşmesini ",
                                          style: context.textTheme.bodyMedium!
                                              .copyWith(
                                                  color: context
                                                      .colorScheme.primary)),
                                      TextSpan(
                                          text: "okudum ve kabul ediyorum ",
                                          style: context.textTheme.bodyMedium!
                                              .copyWith(
                                                  color: context
                                                      .colorScheme.onSurface)),
                                    ])),
                                  ),
                                ],
                              ),
                              BodySmall(data: field.errorText ?? "")
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: context.dynamicWidth(1),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Kayıt Ol",
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
                      text: "Bir hesabın var mı ? ",
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: context.colorScheme.onSurface)),
                  TextSpan(
                      text: "Giriş Yap",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.router.pushNamed(PathConstant.loginPath);
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
