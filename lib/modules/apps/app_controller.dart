import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instalador_forca_de_vendas/model/app/app.dart';
import 'package:instalador_forca_de_vendas/model/versao/versao.dart';
import 'package:instalador_forca_de_vendas/modules/info_app/info_app_screen.dart';
import 'package:instalador_forca_de_vendas/widgets/alert_util.dart';
import 'package:mobx/mobx.dart';
import 'package:instalador_forca_de_vendas/modules/login/login_controller.dart';
import 'package:instalador_forca_de_vendas/modules/loading/loading_controller.dart';
part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  var loginController = GetIt.I.get<LoginController>();
  var loading = GetIt.I.get<Loading>();
  var app = App();
  final appApi = AppApi();
  var versao = Versao();
  final versaoApi = VersaoApi();

  @observable
  ObservableList<App> listaApp;

  @observable
  ObservableList<Versao> listaVersao;

  @action
  Future listarApps(BuildContext context) async {
    loading.setLoading(true);
    await appApi
        .listarAppsEmp(loginController.empresa.id, context)
        .then((apps) {
      listaApp = ObservableList.of(apps);
      loading.setLoading(false);
    });
  }

  @action
  Future infoApp(int idApp, BuildContext context) async {
    loading.setLoading(true);
    Navigator.pushNamed(context, 'info-app-page');
    await versaoApi.listarVersoesAtivas(idApp, context).then((versoes) {
      listaVersao = ObservableList.of(versoes);
    }).whenComplete(() async {
      await appApi.listarApp(idApp, context).then((_app) {
        app = _app;
      }).whenComplete(() {
        loading.setLoading(false);
      });
    });
  }

  
}
