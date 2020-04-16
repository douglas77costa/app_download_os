// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DownloadsController on _DownloadsController, Store {
  final _$statusDownloadAtom =
      Atom(name: '_DownloadsController.statusDownload');

  @override
  StatusDownload get statusDownload {
    _$statusDownloadAtom.context.enforceReadPolicy(_$statusDownloadAtom);
    _$statusDownloadAtom.reportObserved();
    return super.statusDownload;
  }

  @override
  set statusDownload(StatusDownload value) {
    _$statusDownloadAtom.context.conditionallyRunInAction(() {
      super.statusDownload = value;
      _$statusDownloadAtom.reportChanged();
    }, _$statusDownloadAtom, name: '${_$statusDownloadAtom.name}_set');
  }

  final _$progressoAtom = Atom(name: '_DownloadsController.progresso');

  @override
  double get progresso {
    _$progressoAtom.context.enforceReadPolicy(_$progressoAtom);
    _$progressoAtom.reportObserved();
    return super.progresso;
  }

  @override
  set progresso(double value) {
    _$progressoAtom.context.conditionallyRunInAction(() {
      super.progresso = value;
      _$progressoAtom.reportChanged();
    }, _$progressoAtom, name: '${_$progressoAtom.name}_set');
  }

  final _$downloadAppAsyncAction = AsyncAction('downloadApp');

  @override
  Future<dynamic> downloadApp(BuildContext context) {
    return _$downloadAppAsyncAction.run(() => super.downloadApp(context));
  }

  final _$doDownloadAsyncAction = AsyncAction('doDownload');

  @override
  Future<dynamic> doDownload() {
    return _$doDownloadAsyncAction.run(() => super.doDownload());
  }

  final _$_DownloadsControllerActionController =
      ActionController(name: '_DownloadsController');

  @override
  dynamic setProgresso(double newP) {
    final _$actionInfo = _$_DownloadsControllerActionController.startAction();
    try {
      return super.setProgresso(newP);
    } finally {
      _$_DownloadsControllerActionController.endAction(_$actionInfo);
    }
  }
}
