import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/project/model/tags_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';

class AddTagView extends StatefulWidget {
  const AddTagView({Key? key}) : super(key: key);

  @override
  State<AddTagView> createState() => _AddTagViewState();
}

class _AddTagViewState extends State<AddTagView> {
  late double _distanceToField;
  late TextEditingController textcontroller;
  @override
  void initState() {
    super.initState();

    textcontroller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    _distanceToField = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: null,
              child: Text(
                "Kaydet",
              ),
            ),
          ),
        ],
        label: "Etiketler",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BodyMedium(
                data: "Mevcut Etiketler",
                color: context.colorScheme.onSurface.withOpacity(.3),
              ),
            ),
            Expanded(
                child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          textcontroller.text = DependecyService.getIt
                              .get<TagsMobx>()
                              .models[index]
                              .name;
                        },
                        title: BodyMedium(
                            data: DependecyService.getIt
                                .get<TagsMobx>()
                                .models[index]
                                .name),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: context.colorScheme.onSurface.withOpacity(.3),
                      );
                    },
                    itemCount:
                        DependecyService.getIt.get<TagsMobx>().models.length))
          ],
        ),
      ),
    );
  }
}
