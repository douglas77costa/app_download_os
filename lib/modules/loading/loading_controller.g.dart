// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Loading on LoadingController, Store {
  final _$loadingControllerAtom =
      Atom(name: 'LoadingController.loadingController');

  @override
  bool get loadingController {
    _$loadingControllerAtom.context.enforceReadPolicy(_$loadingControllerAtom);
    _$loadingControllerAtom.reportObserved();
    return super.loadingController;
  }

  @override
  set loadingController(bool value) {
    _$loadingControllerAtom.context.conditionallyRunInAction(() {
      super.loadingController = value;
      _$loadingControllerAtom.reportChanged();
    }, _$loadingControllerAtom, name: '${_$loadingControllerAtom.name}_set');
  }

  final _$LoadingControllerActionController =
      ActionController(name: 'LoadingController');

  @override
  dynamic setLoading(bool load) {
    final _$actionInfo = _$LoadingControllerActionController.startAction();
    try {
      return super.setLoading(load);
    } finally {
      _$LoadingControllerActionController.endAction(_$actionInfo);
    }
  }
}
