import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class CustomSvgIcon extends StatelessWidget {
  const CustomSvgIcon(
      {Key? key, required this.file, required this.size, this.color})
      : super(key: key);
  final String file;
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(context.getPath(folder: "svg", file: file),
        width: size,
        height: size,
        color: color ?? context.colorScheme.onSurface);
  }
}
