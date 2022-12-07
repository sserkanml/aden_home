import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class SvgPictureSuffix extends StatelessWidget {
  const SvgPictureSuffix({Key? key, required this.file}) : super(key: key);
  final String file;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(context.getPath(folder: "svg", file: file),
        width: 15, height: 15, color: context.colorScheme.onSurface);
  }
}
