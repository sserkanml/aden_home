// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FoldersModel {
  final String name;
  final String id_folder;
  final List<String> images;
  final String created_time;
  FoldersModel({
    required this.name,
    required this.id_folder,
    required this.images,
    required this.created_time,
  });

  FoldersModel copyWith({
    String? name,
    String? id_folder,
    required List<String> images,
    String? created_time,
  }) {
    return FoldersModel(
      name: name ?? this.name,
      id_folder: id_folder ?? this.id_folder,
      images: images ?? this.images,
      created_time: created_time ?? this.created_time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id_folder': id_folder,
      'images': images,
      'created_time': created_time,
    };
  }

  factory FoldersModel.fromMap(Map<String, dynamic> map) {
    return FoldersModel(
        name: map['name'] as String,
        created_time: map['created_time'] as String,
        id_folder: map['id_folder'] as String,
        images: List<String>.from(
          (map['images'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory FoldersModel.fromJson(String source) =>
      FoldersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoldersModel(name: $name, id_folder: $id_folder, images: $images, created_time: $created_time)';
  }

  @override
  bool operator ==(covariant FoldersModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id_folder == id_folder &&
        listEquals(other.images, images) &&
        other.created_time == created_time;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id_folder.hashCode ^ images.hashCode ^ created_time.hashCode;
  }
}
