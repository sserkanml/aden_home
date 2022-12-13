import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/util/extension.dart';
import 'package:aden/core/widgets/bodymedium.dart';
import 'package:aden/feature/project/model/tags_mobx.dart';
import 'package:aden/feature/project/model/tags_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

import '../../../core/widgets/appbar.dart';

class AddTagView extends StatefulWidget {
  final List<TagsModel>? tagsList;
  const AddTagView({Key? key, this.tagsList}) : super(key: key);

  @override
  State<AddTagView> createState() => _AddTagViewState();
}

class _AddTagViewState extends State<AddTagView> {
  late List<TagsModel> selectedList;
  late List<TagsModel> savedlist;
  List<String> selectedNames = [];
  List<String> tagsListNames = [];
  late int length;
  @override
  void initState() {
    super.initState();
    length = widget.tagsList?.length ?? 0;
    selectedList = widget.tagsList ?? [];
    savedlist = [...selectedList];
    for (var element in selectedList) {
      tagsListNames.add(element.name);
      selectedNames.add(element.name);
    }
  }

  @override
  void didChangeDependencies() {
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
        actions: [
          TextButton(
            onPressed: const ListEquality().equals(selectedNames, tagsListNames)
                ? null
                : () {
                    context.router.pop<List<TagsModel>?>(selectedList);
                  },
            child: const Text(
              "Kaydet",
            ),
          ),
        ],
        label: "Etiketler",
        leading: IconButton(
          onPressed: () {
            context.router.pop<List<TagsModel>?>(savedlist);
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
            Padding(
              padding: context.paddingAll(),
              child: TextFormField(
                style: context.textTheme.bodyMedium!
                    .copyWith(color: context.colorScheme.onSurface),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Arama Yap",
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.all(10),
              child: buildChips(),
            ),
            Visibility(
                visible: selectedList.length > 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BodyMedium(
                    data: "En fazla 4 etiket seçilebilir",
                    color: context.colorScheme.error,
                  ),
                )),
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
                          if (selectedList.length == 4) {
                            return;
                          } else if (selectedList.contains(DependecyService
                              .getIt
                              .get<TagsMobx>()
                              .models[index])) {
                            return;
                          } else {
                            selectedList.add(DependecyService.getIt
                                .get<TagsMobx>()
                                .models[index]);
                            selectedNames.add(DependecyService.getIt
                                .get<TagsMobx>()
                                .models[index]
                                .name);
                          }

                          setState(() {});
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

  Widget buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < selectedList.length; i++) {
      Padding actionChip = Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: InputChip(
          // selected: _selected[i],
          label: Text(selectedList[i].name),

          elevation: 0,
          pressElevation: 0,
          shadowColor: Colors.teal,

          onDeleted: () {
            selectedList.removeAt(i);
            // _selected.removeAt(i);
            selectedNames.removeAt(i);
            setState(() {
              selectedList = selectedList;
              // _selected = _selected;
            });
          },
        ),
      );

      chips.add(actionChip);
    }

    return ListView(
      // This line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }
}
