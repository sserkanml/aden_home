import 'package:aden/core/widgets/headline6.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String label;
  @override
  final Widget? leading;
  final bool? autoImplicity;
  final bool? centerLabel;

  @override
  final List<Widget>? actions;
  final BuildContext context;
  final double? leadingWidth;
  CustomAppBar(
      {Key? key,
      this.leading,
      this.actions,
      this.leadingWidth, 
      this.autoImplicity,
      this.centerLabel,
      required this.label,
      required this.context})
      : super(
            automaticallyImplyLeading: autoImplicity ?? false,
            leadingWidth: leadingWidth,
            actions: actions,
            leading: leading,
            centerTitle: centerLabel,
            title: Headline6(data: label));
}
