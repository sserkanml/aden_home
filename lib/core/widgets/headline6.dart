import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class Headline6 extends StatelessWidget {
  const Headline6({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: context.textTheme.headline6,
    );
  }
}
