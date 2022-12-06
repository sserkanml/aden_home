import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/feature/authentication/widgets/postioned_bottom.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: "Kayıt Ol", context: context),
      body: Stack(
        children: [
          Positioned.fill(
              bottom: 70,
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                children: const [],
              )),
          Positioned(
              height: 70,
              bottom: 0,
              left: 0,
              right: 0,
              child: PositionedBottom(
                  child: Center(
                child: RichText(
                    text:  TextSpan(children: [
                  TextSpan(text:"Bir hesabın var mı ? ",style:context.textTheme.bodyMedium!.copyWith(
                    color:context.colorScheme.onSurface
                  )),
                  TextSpan(text:"Kayıt Ol",style:context.textTheme.bodyMedium!.copyWith(
                    color:context.colorScheme.primary
                  )),
                ])),
              )))
        ],
      ),
    );
  }
}
