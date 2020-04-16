// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Empresa on _Empresa, Store {
  final _$idAtom = Atom(name: '_Empresa.id');

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

  final _$cnpjAtom = Atom(name: '_Empresa.cnpj');

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

  final _$nomeFantasiaAtom = Atom(name: '_Empresa.nomeFantasia');

  @override
  String get nomeFantasia {
    _$nomeFantasiaAtom.context.enforceReadPolicy(_$nomeFantasiaAtom);
    _$nomeFantasiaAtom.reportObserved();
    return super.nomeFantasia;
  }

  @override
  set nomeFantasia(String value) {
    _$nomeFantasiaAtom.context.conditionallyRunInAction(() {
      super.nomeFantasia = value;
      _$nomeFantasiaAtom.reportChanged();
    }, _$nomeFantasiaAtom, name: '${_$nomeFantasiaAtom.name}_set');
  }

  final _$razaoSocialAtom = Atom(name: '_Empresa.razaoSocial');

  @override
  String get razaoSocial {
    _$razaoSocialAtom.context.enforceReadPolicy(_$razaoSocialAtom);
    _$razaoSocialAtom.reportObserved();
    return super.razaoSocial;
  }

  @override
  set razaoSocial(String value) {
    _$razaoSocialAtom.context.conditionallyRunInAction(() {
      super.razaoSocial = value;
      _$razaoSocialAtom.reportChanged();
    }, _$razaoSocialAtom, name: '${_$razaoSocialAtom.name}_set');
  }

  final _$tokenAtom = Atom(name: '_Empresa.token');

  @override
  String get token {
    _$tokenAtom.context.enforceReadPolicy(_$tokenAtom);
    _$tokenAtom.reportObserved();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.context.conditionallyRunInAction(() {
      super.token = value;
      _$tokenAtom.reportChanged();
    }, _$tokenAtom, name: '${_$tokenAtom.name}_set');
  }
}
