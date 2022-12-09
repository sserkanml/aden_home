import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BodySmall extends StatelessWidget {
  const BodySmall({Key? key, required this.data, this.fontWeight, this.color})
      : super(key: key);
  final String data;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodySmall!
          .copyWith(color: color ?? context.colorScheme.onSurface, fontWeight: fontWeight),
    );
  }
}
