import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class OnboardTitle extends StatelessWidget {
  const OnboardTitle({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: context.textTheme.headline6,
    );
  }
}
