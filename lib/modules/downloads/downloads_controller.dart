import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:instalador_forca_de_vendas/model/app/app.dart';
import 'package:instalador_forca_de_vendas/modules/apps/app_controller.dart';
import 'package:instalador_forca_de_vendas/modules/loading/loading_controller.dart';
import 'package:instalador_forca_de_vendas/widgets/alert_util.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'downloads_controller.g.dart';

class DownloadsController = _DownloadsController with _$DownloadsController;

enum StatusDownload { INICIO, BAIXANDO, CONCLUIDO }

abstract class _DownloadsController with Store {
  var loading = GetIt.I.get<Loading>();
  var appController = GetIt.I.get<AppController>();
  String _localPath;
  ReceivePort _port = ReceivePort();


  @observable
  StatusDownload statusDownload = StatusDownload.INICIO;

  @observable
  double progresso = 0;

  @action
  setProgresso(double newP) => progresso = newP;

  Future initServiceDownload()async{
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterDownloader.initialize();
  }

  @action
  Future downloadApp(BuildContext context) async {
    try{
      if (appController.app.qtdInstalacaoFeita + 1 >
          appController.app.qtdInstalacao) {
        AlertUtil.alertWarning(context, "Número máximo de licenças atingida!");
      } else {
        if (await _checkPermission()) {
          doDownload();
        } else {
          AlertUtil.alertErro(context, "Precisamos de acesso para continuar!");
        }
      }
    }catch(e){
      print(e);
    }
  }

  @action
  Future doDownload() async {
    try{
      this.bindBackgroundIsolate();
      statusDownload = StatusDownload.BAIXANDO;
      FlutterDownloader.registerCallback(downloadCallback);
      _localPath = (await _findLocalPath()) + Platform.pathSeparator + 'OSAPPS';
      final savedDir = Directory(_localPath);
      bool hasExisted = await savedDir.exists();
      if (!hasExisted) {
        savedDir.create();
      }
      final taskId = await FlutterDownloader.enqueue(
        url: 'http://192.168.0.13:8080/project/apk/app-release.apk',
        savedDir: _localPath,
        showNotification:
        false, // show download progress in status bar (for Android)
        openFileFromNotification:
        false, // click on notification to open downloaded file (for Android)
      );
    }catch(e){
      print(e);
    }
  }

  Future<String> _findLocalPath() async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<bool> _checkPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    //setProgresso(double.parse(progress.toString()));
    print(
        'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    final SendPort send =
    IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  void bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      print('UI Isolate Callback: $data');
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setProgresso(double.parse(progress.toString()));
      if(progress==100){
        setProgresso(0);
        print("FINALIZADOOO❤");
        _unbindBackgroundIsolate();
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }
}
