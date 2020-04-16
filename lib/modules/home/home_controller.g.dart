// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$navBarControllerAtom = Atom(name: '_HomeController.navBarController');

  @override
  NavBarItem get navBarController {
    _$navBarControllerAtom.context.enforceReadPolicy(_$navBarControllerAtom);
    _$navBarControllerAtom.reportObserved();
    return super.navBarController;
  }

  @override
  set navBarController(NavBarItem value) {
    _$navBarControllerAtom.context.conditionallyRunInAction(() {
      super.navBarController = value;
      _$navBarControllerAtom.reportChanged();
    }, _$navBarControllerAtom, name: '${_$navBarControllerAtom.name}_set');
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic pickItem(int i) {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super.pickItem(i);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }
}
