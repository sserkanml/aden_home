import 'package:aden/core/widgets/appbar.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: "Dashboard", context: context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[],
        ),
      )),
    );
  }
}
