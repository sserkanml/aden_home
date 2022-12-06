import 'package:aden/core/util/extension.dart';
import 'package:aden/feature/start/widgets/svg_picture.dart';
import 'package:flutter/material.dart';

import '../model/onboard_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  _OnboardViewState createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: context.paddingAll(),
              child: PageView.builder(
                  itemBuilder: (context, index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                            elevation: 1,
                            child: OnBoardSvgPicture(
                                file: onBoardData[index].image)));
                  },
                  itemCount: onBoardData.length),
            ),
          ),
          Expanded(
            child: Column(
              children: const <Widget>[],
            ),
          )
        ],
      )),
    );
  }
}
