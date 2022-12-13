// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class ImageManagmentModel {
  final String id;
  bool isSelected;
  final String path;
  ImageManagmentModel({
    required this.id,
    required this.isSelected,
    required this.path,
  });

  ImageManagmentModel copyWith({
    String? id,
    bool? isSelected,
    String? path,
  }) {
    return ImageManagmentModel(
      id: id ?? this.id,
      isSelected: isSelected ?? this.isSelected,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isSelected': isSelected,
      'path': path,
    };
  }

  factory ImageManagmentModel.fromMap(Map<String, dynamic> map) {
    return ImageManagmentModel(
      id: map['id'] as String,
      isSelected: map['isSelected'] as bool,
      path: map['path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageManagmentModel.fromJson(String source) =>
      ImageManagmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ImageManagmentModel(id: $id, isSelected: $isSelected, path: $path)';

  @override
  bool operator ==(covariant ImageManagmentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.isSelected == isSelected &&
        other.path == path;
  }

  @override
  int get hashCode => id.hashCode ^ isSelected.hashCode ^ path.hashCode;
}

class ImageManagmentService {
  static List<AssetEntity> entities = [];
  static List<ImageManagmentModel> imageModel = [];
  static List<ImageManagmentModel> imageModelCopy = [];

  static saveImageModel() {
    imageModel =
        imageModelCopy.where((element) => element.isSelected == true).toList();
  }

  static takeBack() {
    for (var i = 0; i < imageModel.length; i++) {
      for (var j = 0; j < imageModelCopy.length; j++) {
        if (imageModel[i].isSelected == imageModelCopy[j].isSelected) {
          imageModelCopy[j].isSelected = imageModel[i].isSelected;
        } else {}
      }
    }
  }

  static changeActiveSelectedBool(ImageManagmentModel model) {
    model.isSelected = !model.isSelected;
  }

  static int currentPage = 0;
  static int lastPage = 0;
  static List<AssetEntity> entites = [];
  static bool handleScrollEvent(
      ScrollNotification scroll, VoidCallback callback) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        GenerateImagePicker(callback);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<void> GenerateImagePicker(VoidCallback callback) async {
    lastPage = currentPage;
    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    final List<AssetPathEntity> paths =
        await PhotoManager.getAssetPathList(type: RequestType.image);
    final media = await paths[1].getAssetListPaged(page: currentPage, size: 80);
    entites.addAll(media);

    for (var element in media) {
      final File? file = await element.file;
      imageModelCopy.add(ImageManagmentModel(
          id: element.id, isSelected: false, path: file!.path));
    }

    callback();
  }
}
