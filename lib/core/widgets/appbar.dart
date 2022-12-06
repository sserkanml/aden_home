import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomAppBar extends AppBar {
  final String label;
  @override
  final Widget? leading;
  final bool? autoImplicity;
  final bool? centerLabel;
  @override
  final List<Widget>? actions;
  final BuildContext context;
  CustomAppBar(
      {Key? key,
      this.leading,
      this.actions,
      this.autoImplicity,
      this.centerLabel,
      required this.label,
      required this.context})
      : super(
            actions: actions,
            leading: leading,
            centerTitle: centerLabel,
            title: Text(
              label,
              style: context.textTheme.headline6,
            ));
}
