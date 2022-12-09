import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "scanQrCode",
        onPressed: () {},
        child: SvgPicture.asset(
          context.getPath(folder: "svg", file: "qr_code.svg"),
          color: Colors.white,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
