// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$validateCnpjAtom = Atom(name: '_LoginController.validateCnpj');

  @override
  dynamic get validateCnpj {
    _$validateCnpjAtom.context.enforceReadPolicy(_$validateCnpjAtom);
    _$validateCnpjAtom.reportObserved();
    return super.validateCnpj;
  }

  @override
  set validateCnpj(dynamic value) {
    _$validateCnpjAtom.context.conditionallyRunInAction(() {
      super.validateCnpj = value;
      _$validateCnpjAtom.reportChanged();
    }, _$validateCnpjAtom, name: '${_$validateCnpjAtom.name}_set');
  }

  final _$validateCpfAtom = Atom(name: '_LoginController.validateCpf');

  @override
  dynamic get validateCpf {
    _$validateCpfAtom.context.enforceReadPolicy(_$validateCpfAtom);
    _$validateCpfAtom.reportObserved();
    return super.validateCpf;
  }

  @override
  set validateCpf(dynamic value) {
    _$validateCpfAtom.context.conditionallyRunInAction(() {
      super.validateCpf = value;
      _$validateCpfAtom.reportChanged();
    }, _$validateCpfAtom, name: '${_$validateCpfAtom.name}_set');
  }

  final _$pageAtom = Atom(name: '_LoginController.page');

  @override
  String get page {
    _$pageAtom.context.enforceReadPolicy(_$pageAtom);
    _$pageAtom.reportObserved();
    return super.page;
  }

  @override
  set page(String value) {
    _$pageAtom.context.conditionallyRunInAction(() {
      super.page = value;
      _$pageAtom.reportChanged();
    }, _$pageAtom, name: '${_$pageAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<dynamic> login(
      BuildContext context, GlobalKey<State<StatefulWidget>> _globalKey) {
    return _$loginAsyncAction.run(() => super.login(context, _globalKey));
  }

  final _$_salvarLoginAsyncAction = AsyncAction('_salvarLogin');

  @override
  Future<dynamic> _salvarLogin() {
    return _$_salvarLoginAsyncAction.run(() => super._salvarLogin());
  }

  final _$verificarLoginAsyncAction = AsyncAction('verificarLogin');

  @override
  Future<dynamic> verificarLogin(BuildContext context) {
    return _$verificarLoginAsyncAction.run(() => super.verificarLogin(context));
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  dynamic validarCnpj(String cnpj) {
    final _$actionInfo = _$_LoginControllerActionController.startAction();
    try {
      return super.validarCnpj(cnpj);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validarCpf(String cpf) {
    final _$actionInfo = _$_LoginControllerActionController.startAction();
    try {
      return super.validarCpf(cpf);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }
}
