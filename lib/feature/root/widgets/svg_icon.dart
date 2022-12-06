import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

class BottomSvgIcon extends StatelessWidget {
  const BottomSvgIcon({Key? key, required this.file, required this.color}) : super(key: key);
  final String file;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      context.getPath(folder: "svg", file: file),
      width: 20,
      height: 20,
      color: color,
    );
  }
}
