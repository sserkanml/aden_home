import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BodyMedium extends StatelessWidget {
  const BodyMedium({Key? key, required this.data, this.fontWeight, this.color}) : super(key: key);
  final String data;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodyMedium!.copyWith(
        color: color,
        fontWeight: fontWeight
      ),
    );
  }
}
