import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class Headline6 extends StatelessWidget {
  const Headline6(
      {Key? key,
      required this.data,
      this.fontWeight,
      this.textAlign,
      this.color})
      : super(key: key);
  final String data;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: context.textTheme.headline6!.copyWith(
          color: color ?? context.colorScheme.onSurface, fontWeight: fontWeight),
    );
  }
}
