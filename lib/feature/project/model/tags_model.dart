// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/service/supabase_service.dart';

class TagsModel {
  final String tags_id;
   String name;
  TagsModel({
    required this.tags_id,
    required this.name,
  });

  TagsModel copyWith({
    String? tags_id,
    String? name,
  }) {
    return TagsModel(
      tags_id: tags_id ?? this.tags_id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tags_id': tags_id,
      'name': name,
    };
  }

  factory TagsModel.fromMap(Map<String, dynamic> map) {
    return TagsModel(
      tags_id: map['tags_id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TagsModel.fromJson(String source) =>
      TagsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TagsModel(tags_id: $tags_id, name: $name)';

  @override
  bool operator ==(covariant TagsModel other) {
    if (identical(this, other)) return true;

    return other.tags_id == tags_id && other.name == name;
  }

  @override
  int get hashCode => tags_id.hashCode ^ name.hashCode;
}

class TagsService {
  static Future<List<TagsModel>> getAllTags() async {
    try {
      final response = await DependecyService.getIt
          .get<SupabaseService>()
          .supabaseClient
          .from('tags')
          .select()
          .order('name', ascending: true);
      List<TagsModel> data = [];
      data = response.map<TagsModel>((element) {
        return TagsModel.fromMap(element);
      }).toList();
    
      return data;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
