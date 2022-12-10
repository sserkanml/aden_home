import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ItemAddTextField extends StatelessWidget {
  const ItemAddTextField({Key? key, required this.hintText}) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.textTheme.headline6!
          .copyWith(color: context.colorScheme.onSurface),
      decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none),
    );
  }
}
