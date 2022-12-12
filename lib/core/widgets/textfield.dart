import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

typedef ValidatorMessage = String? Function();

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.labelText,
      this.obscureText,
      this.suffix,
      this.prefix,
      this.textInputType,
      this.ontap,
      this.readonly,
      this.activatedautovalidateMode,
      this.validateFunction, this.controller})
      : super(key: key);
  final String labelText;
  final Widget? suffix;
  final ValidatorMessage? validateFunction;
  final Widget? prefix;
  final bool? readonly;
  final bool? activatedautovalidateMode;
  final TextInputType? textInputType;
  final VoidCallback? ontap;
  final TextEditingController? controller;

  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
     
      validator: (value) {
        final String? validateAnswer =
            validateFunction == null ? null : validateFunction!();
        return validateAnswer;
      },
      onSaved: (newValue) {},
      readOnly: readonly ?? false,
      style: context.textTheme.bodyMedium!
          .copyWith(color: context.colorScheme.onSurface),
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      controller: controller,
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
