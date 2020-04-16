// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppController, Store {
  final _$listaAppAtom = Atom(name: '_AppController.listaApp');

  @override
  ObservableList<App> get listaApp {
    _$listaAppAtom.context.enforceReadPolicy(_$listaAppAtom);
    _$listaAppAtom.reportObserved();
    return super.listaApp;
  }

  @override
  set listaApp(ObservableList<App> value) {
    _$listaAppAtom.context.conditionallyRunInAction(() {
      super.listaApp = value;
      _$listaAppAtom.reportChanged();
    }, _$listaAppAtom, name: '${_$listaAppAtom.name}_set');
  }

  final _$listaVersaoAtom = Atom(name: '_AppController.listaVersao');

  @override
  ObservableList<Versao> get listaVersao {
    _$listaVersaoAtom.context.enforceReadPolicy(_$listaVersaoAtom);
    _$listaVersaoAtom.reportObserved();
    return super.listaVersao;
  }

  @override
  set listaVersao(ObservableList<Versao> value) {
    _$listaVersaoAtom.context.conditionallyRunInAction(() {
      super.listaVersao = value;
      _$listaVersaoAtom.reportChanged();
    }, _$listaVersaoAtom, name: '${_$listaVersaoAtom.name}_set');
  }

  final _$listarAppsAsyncAction = AsyncAction('listarApps');

  @override
  Future<dynamic> listarApps(BuildContext context) {
    return _$listarAppsAsyncAction.run(() => super.listarApps(context));
  }

  final _$infoAppAsyncAction = AsyncAction('infoApp');

  @override
  Future<dynamic> infoApp(int idApp, BuildContext context) {
    return _$infoAppAsyncAction.run(() => super.infoApp(idApp, context));
  }
}
