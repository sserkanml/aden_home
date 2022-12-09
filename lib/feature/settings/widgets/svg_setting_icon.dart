import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

class SvgSettingIcon extends StatelessWidget {
  const SvgSettingIcon({Key? key, required this.file}) : super(key: key);
  final String file;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      context.getPath(folder: "svg", file: file),
      color: context.colorScheme.onSurface,
      width: 20,
      height: 20,
    );
  }
}
