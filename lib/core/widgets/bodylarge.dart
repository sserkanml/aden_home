import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BodyLarge extends StatelessWidget {
  const BodyLarge({Key? key, required this.data,  this.fontweight}) : super(key: key);
  final String data;
  final FontWeight? fontweight;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodyLarge!.copyWith(
        fontWeight: fontweight
      ),
    );
  }
}
