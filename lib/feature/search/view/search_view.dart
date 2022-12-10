import 'package:aden/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool isFocusing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      SingleChildScrollView(child: Column(
        children: <Widget>[],
      ),)),
      resizeToAvoidBottomInset: false,
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (isFocusing) {
              setState(() {
                isFocusing = false;
                FocusScope.of(context).unfocus();
              });
            }
          },
          icon: Icon(isFocusing ? Icons.arrow_back : Icons.search),
        ),
        title: TextField(
          onTap: () {
            setState(() {
              isFocusing = !isFocusing;
            });
          },
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Arama Yap"),
        ),
      ),
    );
  }
}
