import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/service/supabase_service.dart';
import 'package:aden/feature/project/model/tags_model.dart';
import 'package:mobx/mobx.dart';
part 'tags_mobx.g.dart';

class TagsMobx = _TagsMobxBase with _$TagsMobx;

abstract class _TagsMobxBase with Store {
  @observable
  List<TagsModel> models = [];

  @observable
  List<TagsModel> copyModels = [];

  List<String> tags_name_deleted = [];
  List<String> tags_name_updated = [];
  List<String> tags_name_updated_value = [];

  @observable
  bool isSorted = false;

  @action
  void refreshModel() {
    models = models;
  }

  @action
  void refreshCopyModel() {
    copyModels = copyModels;
  }

  @action
  Future<void> updateTagOriginal(
      List<String> updated, List<String> value) async {
    for (var i = 0; i < updated.length; i++) {
      final response = await DependecyService.getIt
          .get<SupabaseService>()
          .supabaseClient
          .from('tags')
          .update({'name': value[i]}).match({'tags_id': updated[i]});
    }
    models = copyModels.map<TagsModel>((e) {
      return TagsModel(tags_id: e.tags_id, name: e.name).copyWith();
    }).toList();
    tags_name_updated = [];
    tags_name_updated_value = [];
  }

  Future<void> updateTags({required String value, required String id}) async {
    copyModels.where((element) => element.tags_id == id).first.name = value;
    tags_name_updated.add(id);
    tags_name_updated_value.add(value);
  }

  @action
  Future<void> deleteTagOriginal(List<String> deleted) async {
    for (var element in deleted) {
      final response = await DependecyService.getIt
          .get<SupabaseService>()
          .supabaseClient
          .from('tags')
          .delete()
          .match({'name': element});
    }
    models = copyModels.map<TagsModel>((e) {
      return TagsModel(tags_id: e.tags_id, name: e.name).copyWith();
    }).toList();
    tags_name_deleted = [];
  }

  @action
  Future<void> deleteTag({required String name}) async {
    copyModels
        .remove(copyModels.where((element) => element.name == name).first);
    refreshCopyModel();
    tags_name_deleted.add(name);
  }

  @action
  void takeBack() {
    copyModels = models.map<TagsModel>((e) {
      return TagsModel(tags_id: e.tags_id, name: e.name).copyWith();
    }).toList();
  }

  @action
  Future<void> createTag({required String name}) async {
    await DependecyService.getIt
        .get<SupabaseService>()
        .supabaseClient
        .from('tags')
        .insert({'name': name});

    final response = await DependecyService.getIt
        .get<SupabaseService>()
        .supabaseClient
        .from('tags')
        .select()
        .eq("name", name)
        .limit(1)
        .single();

    TagsModel tagsModel = TagsModel.fromMap(response);

    models.add(tagsModel);
    copyModels.add(tagsModel);
    refreshCopyModel();
    refreshModel();
  }

  @action
  void sortTags() {
    copyModels = copyModels.reversed.toList();
    isSorted = !isSorted;

    refreshModel();
  }
}
