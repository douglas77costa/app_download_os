// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendedor.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Vendedor on _Vendedor, Store {
  final _$idAtom = Atom(name: '_Vendedor.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$cpfAtom = Atom(name: '_Vendedor.cpf');

  @override
  String get cpf {
    _$cpfAtom.context.enforceReadPolicy(_$cpfAtom);
    _$cpfAtom.reportObserved();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.context.conditionallyRunInAction(() {
      super.cpf = value;
      _$cpfAtom.reportChanged();
    }, _$cpfAtom, name: '${_$cpfAtom.name}_set');
  }

  final _$cnpjAtom = Atom(name: '_Vendedor.cnpj');

  @override
  String get cnpj {
    _$cnpjAtom.context.enforceReadPolicy(_$cnpjAtom);
    _$cnpjAtom.reportObserved();
    return super.cnpj;
  }

  @override
  set cnpj(String value) {
    _$cnpjAtom.context.conditionallyRunInAction(() {
      super.cnpj = value;
      _$cnpjAtom.reportChanged();
    }, _$cnpjAtom, name: '${_$cnpjAtom.name}_set');
  }

  final _$_VendedorActionController = ActionController(name: '_Vendedor');

  @override
  dynamic setId(int nId) {
    final _$actionInfo = _$_VendedorActionController.startAction();
    try {
      return super.setId(nId);
    } finally {
      _$_VendedorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCpf(String nCpf) {
    final _$actionInfo = _$_VendedorActionController.startAction();
    try {
      return super.setCpf(nCpf);
    } finally {
      _$_VendedorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCnpj(String nCnpj) {
    final _$actionInfo = _$_VendedorActionController.startAction();
    try {
      return super.setCnpj(nCnpj);
    } finally {
      _$_VendedorActionController.endAction(_$actionInfo);
    }
  }
}
