// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FolderMobx on _FolderMobxBase, Store {
  late final _$foldersAtom =
      Atom(name: '_FolderMobxBase.folders', context: context);

  @override
  List<FoldersModel> get folders {
    _$foldersAtom.reportRead();
    return super.folders;
  }

  @override
  set folders(List<FoldersModel> value) {
    _$foldersAtom.reportWrite(value, super.folders, () {
      super.folders = value;
    });
  }

  late final _$getAllFoldersAsyncAction =
      AsyncAction('_FolderMobxBase.getAllFolders', context: context);

  @override
  Future<void> getAllFolders() {
    return _$getAllFoldersAsyncAction.run(() => super.getAllFolders());
  }

  late final _$_FolderMobxBaseActionController =
      ActionController(name: '_FolderMobxBase', context: context);

  @override
  void RefreshState() {
    final _$actionInfo = _$_FolderMobxBaseActionController.startAction(
        name: '_FolderMobxBase.RefreshState');
    try {
      return super.RefreshState();
    } finally {
      _$_FolderMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFolder({required FoldersModel folder}) {
    final _$actionInfo = _$_FolderMobxBaseActionController.startAction(
        name: '_FolderMobxBase.addFolder');
    try {
      return super.addFolder(folder: folder);
    } finally {
      _$_FolderMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
folders: ${folders}
    ''';
  }
}
