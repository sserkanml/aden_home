import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/service/supabase_service.dart';
import 'package:aden/feature/project/model/folders_model.dart';
import 'package:mobx/mobx.dart';
part 'folder_mobx.g.dart';

class FolderMobx = _FolderMobxBase with _$FolderMobx;

abstract class _FolderMobxBase with Store {
  @observable
  List<FoldersModel> folders = [];

  List<String> images = [];
  @action
  void RefreshState() {
    folders = folders;
  }

  @action
  void addFolder({required FoldersModel folder}) {
    folders.add(folder);
    RefreshState();
  }

  Future<void> getImages({required String id}) async {
    List<dynamic> dto = await DependecyService.getIt
        .get<SupabaseService>()
        .supabaseClient
        .from('images_folder')
        .select('path')
        .match({'folder_id': id});

    final List<String> result = dto.map<String>((item) {
      return item['path'];
    }).toList();
    images = result;
  }

  @action
  Future<void> getAllFolders() async {
    final dto = await DependecyService.getIt
        .get<SupabaseService>()
        .supabaseClient
        .from('folders')
        .select('id_folder,created_time,name');
    for (var i = 0; i < dto.length; i++) {
      await getImages(id: dto[i]['id_folder']);

      folders.add(FoldersModel(
          name: dto[i]['name'],
          id_folder: dto[i]['id_folder'],
          images: images,
          created_time: dto[i]['created_time']));
    }
    RefreshState();
  }
}
