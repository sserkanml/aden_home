import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PositionedBottom extends StatelessWidget {
const PositionedBottom({ Key? key, required this.child }) : super(key: key);
final Widget child;
  @override
  Widget build(BuildContext context){
    return Container(
      child: child,
      decoration: BoxDecoration(
        color:context.colorScheme.onSurface,
        boxShadow: [
              BoxShadow(color: context.colorScheme.onSurface.withOpacity(.3),blurRadius: 3)
        ]
      ),
    );
  }
}