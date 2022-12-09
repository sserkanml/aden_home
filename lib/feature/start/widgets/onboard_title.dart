import 'package:aden/core/widgets/headline6.dart';
import 'package:flutter/material.dart';

class OnboardTitle extends StatelessWidget {
  const OnboardTitle({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Headline6(
      data: label,
    );
  }
}
