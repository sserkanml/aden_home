import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class DashboardListNoItem extends StatelessWidget {
  const DashboardListNoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment : MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          context.getPath(file: "add_item.svg", folder: "svg"),
          width: 60,
          height: 60,
          color: context.colorScheme.onSurface.withOpacity(.4),
        ),
        const SizedBox(height: 35),
        const BodySmall(data: "Malzeme Ekle"),
      ],
    );
  }
}
