import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/settings/widgets/svg_setting_icon.dart';
import 'package:flutter/widgets.dart';

class EverythingFolder extends StatelessWidget {
  const EverythingFolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAll(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          BodyMedium(data: "Herşey"),
          SvgSettingIcon(file: "file.svg")
        ],
      ),
    );
  }
}
