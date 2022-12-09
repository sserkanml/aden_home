import 'package:aden/feature/root/widgets/bottom_item_text.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'bottom_icon_svg.dart';

class BottomBarItemWidget extends StatelessWidget {
  const BottomBarItemWidget(
      {Key? key,
      required this.file,
      required this.color,
      required this.data,
      required this.callback})
      : super(key: key);
  final String file;
  final VoidCallback callback;
  final Color color;
  final String data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(1),
      child: Material(
        child: IconButton(
          onPressed: () {
            callback();
          },
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BottomSvgIcon(
                file: file,
                color: color,
              ),
              FittedBox(child: BottomItemText(data: data, color: color))
            ],
          ),
        ),
      ),
    );
  }
}
