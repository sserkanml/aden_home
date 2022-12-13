// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TagsMobx on _TagsMobxBase, Store {
  late final _$modelsAtom =
      Atom(name: '_TagsMobxBase.models', context: context);

  @override
  List<TagsModel> get models {
    _$modelsAtom.reportRead();
    return super.models;
  }

  @override
  set models(List<TagsModel> value) {
    _$modelsAtom.reportWrite(value, super.models, () {
      super.models = value;
    });
  }

  late final _$copyModelsAtom =
      Atom(name: '_TagsMobxBase.copyModels', context: context);

  @override
  List<TagsModel> get copyModels {
    _$copyModelsAtom.reportRead();
    return super.copyModels;
  }

  @override
  set copyModels(List<TagsModel> value) {
    _$copyModelsAtom.reportWrite(value, super.copyModels, () {
      super.copyModels = value;
    });
  }

  late final _$isSortedAtom =
      Atom(name: '_TagsMobxBase.isSorted', context: context);

  @override
  bool get isSorted {
    _$isSortedAtom.reportRead();
    return super.isSorted;
  }

  @override
  set isSorted(bool value) {
    _$isSortedAtom.reportWrite(value, super.isSorted, () {
      super.isSorted = value;
    });
  }

  late final _$updateTagOriginalAsyncAction =
      AsyncAction('_TagsMobxBase.updateTagOriginal', context: context);

  @override
  Future<void> updateTagOriginal(List<String> updated, List<String> value) {
    return _$updateTagOriginalAsyncAction
        .run(() => super.updateTagOriginal(updated, value));
  }

  late final _$deleteTagOriginalAsyncAction =
      AsyncAction('_TagsMobxBase.deleteTagOriginal', context: context);

  @override
  Future<void> deleteTagOriginal(List<String> deleted) {
    return _$deleteTagOriginalAsyncAction
        .run(() => super.deleteTagOriginal(deleted));
  }

  late final _$deleteTagAsyncAction =
      AsyncAction('_TagsMobxBase.deleteTag', context: context);

  @override
  Future<void> deleteTag({required String name}) {
    return _$deleteTagAsyncAction.run(() => super.deleteTag(name: name));
  }

  late final _$createTagAsyncAction =
      AsyncAction('_TagsMobxBase.createTag', context: context);

  @override
  Future<void> createTag({required String name}) {
    return _$createTagAsyncAction.run(() => super.createTag(name: name));
  }

  late final _$_TagsMobxBaseActionController =
      ActionController(name: '_TagsMobxBase', context: context);

  @override
  void refreshModel() {
    final _$actionInfo = _$_TagsMobxBaseActionController.startAction(
        name: '_TagsMobxBase.refreshModel');
    try {
      return super.refreshModel();
    } finally {
      _$_TagsMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refreshCopyModel() {
    final _$actionInfo = _$_TagsMobxBaseActionController.startAction(
        name: '_TagsMobxBase.refreshCopyModel');
    try {
      return super.refreshCopyModel();
    } finally {
      _$_TagsMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void takeBack() {
    final _$actionInfo = _$_TagsMobxBaseActionController.startAction(
        name: '_TagsMobxBase.takeBack');
    try {
      return super.takeBack();
    } finally {
      _$_TagsMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortTags() {
    final _$actionInfo = _$_TagsMobxBaseActionController.startAction(
        name: '_TagsMobxBase.sortTags');
    try {
      return super.sortTags();
    } finally {
      _$_TagsMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
models: ${models},
copyModels: ${copyModels},
isSorted: ${isSorted}
    ''';
  }
}
