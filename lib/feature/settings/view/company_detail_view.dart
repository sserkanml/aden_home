import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/appbar.dart';
import 'package:aden/core/widgets/bodylarge.dart';
import 'package:aden/core/widgets/bodysmal.dart';
import 'package:aden/feature/settings/service/company_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next/views/next_accordion.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/bodymedium.dart';
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
            CustomTextFormField(
              labelText: "Endüstri",
              readonly: true,
              ontap: () {
                showModalBottomSheet(
                  useRootNavigator: true,
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setModalState) {
                        return Container(
                          padding: context.paddingAll(),
                          height: context.dynamicHeight(.3),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "İptal Et",
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Tamamla",
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child:
                                    FutureBuilder<List<CompanyIndustryModel?>?>(
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (snapshot.hasError) {
                                      return const Text("error var");
                                    } else {
                                      return ListView.separated(
                                          shrinkWrap: true,
                                          primary: true,
                                          addAutomaticKeepAlives: true,
                                          clipBehavior: Clip.hardEdge,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              child: ListTile(
                                                onTap: () {},
                                                title: Center(
                                                  child: BodyMedium(
                                                      data: snapshot
                                                              .data?[index]
                                                              ?.name ??
                                                          "diğer"),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return Divider(
                                              height: 0,
                                              color: context
                                                  .colorScheme.onSurface
                                                  .withOpacity(.3),
                                            );
                                          },
                                          itemCount:
                                              snapshot.data?.length ?? 10);
                                    }
                                  },
                                  future: CompanyIndustryService
                                      .getIndustryService(),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
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
