import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/service/supabase_service.dart';

class CreateFolderDatabase {
  Future<void> createFolder(
      {required String folderName, List<String>? images}) async {
    final data = await DependecyService.getIt
        .get<SupabaseService>()
        .supabaseClient
        .from('folders')
        .insert({'name': folderName});
    final folder = await DependecyService.getIt
        .get<SupabaseService>()
        .supabaseClient
        .from('folders')
        .select('*')
        .order('created_timestamp', ascending: false)
        .limit(1);
    if (images == null) {
      
      return;
    } else {
      for (var element in images) {
     
        final data = await DependecyService.getIt
            .get<SupabaseService>()
            .supabaseClient
            .from('images_folder')
            .insert({'path': element, 'folder_id': folder[0]['id_folder']});
      }
    }
  }
}
