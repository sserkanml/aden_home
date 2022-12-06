import 'package:aden/feature/root/widgets/bottom_item_text.dart';
import 'package:aden/feature/root/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class BottomBarItemWidget extends StatelessWidget {
  const BottomBarItemWidget(
      {Key? key, required this.file, required this.color, required this.data})
      : super(key: key);
  final String file;
  final Color color;
  final String data;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Column(
        children: <Widget>[
      BottomSvgIcon(
        file: file,
        color: color,
      ),
      BottomItemText(data: data, color: color)
        ],
      ),
    );
  }
}
