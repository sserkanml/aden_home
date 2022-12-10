import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodymedium.dart';

class FolderWithoutArrowDown extends StatelessWidget {
const FolderWithoutArrowDown({ Key? key, required this.file, required this.data }) : super(key: key);
 final String file;
  final String data;
  @override
  Widget build(BuildContext context){
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
    
      ],
    );
  }
}