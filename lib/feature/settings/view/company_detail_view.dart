import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next/views/next_accordion.dart';


import '../../../core/widgets/textfield.dart';

class CompanyDetailView extends StatelessWidget {
  const CompanyDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Şirket Detay",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        autoImplicity: true,
        context: context,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: context.paddingAll(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            const CustomTextFormField(labelText: "Şirket İsmi"),
            const SizedBox(height: 20),
            const CustomTextFormField(labelText: "Endüstri"),
            const SizedBox(height: 30),
            NextAccordion(
              initiallyExpanded: false,
              title: const BodyLarge(
                data: "Hesabı Sil",
              ),
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.end,
                      children: <Widget>[
                        const BodySmall(
                            data:
                                "bu çalışma alanını ve tüm verilerinizi - kullanıcılar, klasörler, öğeler dahil - kalıcı olarak silmek isterseniz, bunu aşağıdan yapabilirsiniz"),
                        TextButton(
                          onPressed: () {},
                          child: const BodySmall(
                            data: "Hesabı Sil",
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
