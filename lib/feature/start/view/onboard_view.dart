import 'package:aden/core/constant/path_constant.dart';
import 'package:aden/core/util/extension.dart';
import 'package:aden/feature/start/widgets/onboard_title.dart';
import 'package:aden/feature/start/widgets/svg_picture.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../model/onboard_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: context.paddingAll(),
              child: Card(
                elevation: 1,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnBoardSvgPicture(file: onBoardData[index].image);
                    },
                    itemCount: onBoardData.length),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: context.paddingAll(),
              child: Column(
                children: <Widget>[
                  IndexedStack(
                    index: currentIndex,
                    children: [
                      ...List.generate(
                        onBoardData.length,
                        (index) {
                          return Center(
                              child: OnboardTitle(
                                  label: onBoardData[index].label));
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ...List.generate(
                        onBoardData.length,
                        (index) {
                          return Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onSurface
                                        .withOpacity(.2)),
                          );
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: context.dynamicWidth(1),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.pushNamed(PathConstant.signupPath);
                      },
                      child: const Text(
                        "Başlayalım",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
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
                        style: context.textTheme.bodyMedium!.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: FontWeight.bold)),
                  ])),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
