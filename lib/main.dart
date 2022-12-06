import 'package:aden/feature/start/view/onboard_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Envanterus',
      debugShowCheckedModeBanner: false,
      home: OnboardView(),
    );
  }
}
