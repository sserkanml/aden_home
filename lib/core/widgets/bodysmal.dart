import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BodySmall extends StatelessWidget {
  const BodySmall({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.bodySmall,
    );
  }
}
