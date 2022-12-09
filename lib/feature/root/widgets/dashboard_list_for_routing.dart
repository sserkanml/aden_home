import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DashboardListForRouting extends StatelessWidget {
  const DashboardListForRouting({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: context.colorScheme.background,
        child: child,
      ),
    );
  }
}
