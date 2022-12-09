import 'package:flutter/material.dart';

import '../../../core/widgets/bodymedium.dart';

class AnyFolderWithoutIcon extends StatelessWidget {
  const AnyFolderWithoutIcon({Key? key, required this.data}) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 5),
        BodyMedium(data: data),
        const SizedBox(width: 5),
        const Icon(Icons.arrow_drop_down)
      ],
    );
    ;
  }
}
