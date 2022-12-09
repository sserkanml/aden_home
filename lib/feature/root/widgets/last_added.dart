import 'package:flutter/material.dart';

import '../../../core/widgets/bodylarge.dart';

class LastAdded extends StatelessWidget {
  const LastAdded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: BodyLarge(data: "Son Eklenenler"),
    );
  }
}
