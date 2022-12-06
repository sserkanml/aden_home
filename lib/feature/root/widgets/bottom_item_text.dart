import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BottomItemText extends StatelessWidget {
const BottomItemText({ Key? key, required this.data, required this.color }) : super(key: key);
final String data;
final Color color;
  @override
  Widget build(BuildContext context){
    return Text(data,style: context.textTheme.bodySmall!.copyWith(
      fontSize:12,
      color: color
    ),);
  }
}