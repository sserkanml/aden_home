import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.labelText,
      this.obscureText,
      this.suffix,
      this.prefix,
      this.textInputType})
      : super(key: key);
  final String labelText;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputType? textInputType;

  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffix,
          prefixIcon: prefix,
          filled: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          fillColor: context.colorScheme.onSurface.withOpacity(.07),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          )),
    );
  }
}
