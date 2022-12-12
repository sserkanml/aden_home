import 'package:aden/core/util/extension.dart';
import 'package:aden/core/view_model/validator_view_model.dart';
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
  late TextEditingController emailcontroller;
  late TextEditingController namecontroller;
  late TextEditingController passwordcontroller;
  @override
  void initState() {
    namecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    namecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Kayıt Ol",
        context: context,
        autoImplicity: true,
      ),
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
                  child: Form(
                    key: ValidatorService.signUpForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BodyLarge(
                          data: "Bir Hesap Oluştur !",
                          fontweight: FontWeight.bold,
                        ),
                        const SizedBox(height: 10),
                        const BodyMedium(
                            data:
                                "Bugün bir hesap oluşturarak başlayabilirsin"),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          labelText: "Ad Soyad",
                          controller: namecontroller,
                          validateFunction: () {
                            return ValidatorService.validateIsEmpty(
                                value: namecontroller.text);
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          labelText: "Email",
                          controller: emailcontroller,
                          validateFunction: () {
                            return ValidatorService.validateIsEmpty(
                                    value: emailcontroller.text) ??
                                ValidatorService.validateEmail(
                                    value: emailcontroller.text);
                          },
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: passwordcontroller,
                          validateFunction: () {
                            return ValidatorService.validateIsEmpty(
                                    value: passwordcontroller.text) ??
                                ValidatorService.validatePassword(
                                    value: passwordcontroller.text);
                          },
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
                        FormField<bool>(
                          validator: (value) {
                            if (isClickCheckbox == false) {
                              return "Bu alan boş geçilemez";
                            } else {
                              return null;
                            }
                          },
                          builder: (field) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    color: context.colorScheme
                                                        .onSurface)),
                                      ])),
                                    ),
                                  ],
                                ),
                                BodySmall(
                                  data: field.errorText ?? "",
                                  color: context.colorScheme.error,
                                )
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: context.dynamicWidth(1),
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              ValidatorService.validateForm();
                            },
                            child: const Text(
                              "Kayıt Ol",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
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
