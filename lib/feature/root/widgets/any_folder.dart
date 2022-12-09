import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class AnyFolder extends StatelessWidget {
  final String file;
  final String data;
  const AnyFolder({Key? key, required this.file, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          context.getPath(folder: "svg", file: file),
          width: 15,
          height: 15,
          color: context.colorScheme.onSurface,
        ),
        const SizedBox(width: 5),
        BodyMedium(data: data),
        const SizedBox(width: 5),
        const Icon(Icons.arrow_drop_down)
      ],
    );
  }
}
