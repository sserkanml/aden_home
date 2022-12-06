import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.labelText,
      this.obscureText,
      this.suffix,
      this.prefix})
      : super(key: key);
  final String labelText;
  final Widget? suffix;
  final Widget? prefix;

  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffix,
          prefixIcon: prefix,
          filled: true,
          fillColor: context.colorScheme.onSurface.withOpacity(.07),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          )),
    );
  }
}
