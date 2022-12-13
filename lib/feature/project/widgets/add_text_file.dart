import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ItemAddTextField extends StatelessWidget {
  const ItemAddTextField({Key? key, required this.hintText}) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Bu alan boş geçilemez";
        } else {
          return null;
        }
      },
      style: context.textTheme.bodyLarge!
          .copyWith(color: context.colorScheme.onSurface.withOpacity(.4))
          .copyWith(color: context.colorScheme.onSurface),
      decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none),
    );
  }
}
