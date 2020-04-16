import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';
import 'package:instalador_forca_de_vendas/widgets/alert_util.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';

part 'app.g.dart';

class App extends _App with _$App {

  App({
    String descricao,
    String nome,
    String srcLogo,
    String srcLocalLogo,
    int idEmpresa,
    int qtdInstalacao,
    int qtdInstalacaoFeita,
    int id,
  }) : super(
            descricao: descricao,
            nome: nome,
            srcLocalLogo: srcLocalLogo,
            srcLogo: srcLogo,
            idEmpresa: idEmpresa,
            qtdInstalacao: qtdInstalacao,
            qtdInstalacaoFeita: qtdInstalacaoFeita,
            id: id);

  factory App.fromMap(Map<String, dynamic> json) => App(
        descricao: json["descricao"],
        nome: json["nome"],
        srcLogo: json["srcLogo"],
        srcLocalLogo: json["srcLocalLogo"],
        idEmpresa: json["idEmpresa"],
        qtdInstalacao: json["qtdInstalacao"],
        qtdInstalacaoFeita: json["qtdInstalacaoFeita"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "descricao": descricao,
        "nome": nome,
        "srcLogo": srcLogo,
        "srcLocalLogo": srcLocalLogo,
        "idEmpresa": idEmpresa,
        "qtdInstalacao": qtdInstalacao,
        "qtdInstalacaoFeita": qtdInstalacaoFeita,
        "id": id,
      };
}

class AppList {
  final List<App> apps;

  AppList({
    this.apps,
  });

  factory AppList.fromJson(List<dynamic> parsedJson) {

    List<App> apps = new List<App>();
    apps = parsedJson.map((i)=>App.fromMap(i)).toList();

    return new AppList(
        apps: apps
    );
  }
}

abstract class _App with Store {
  @observable
  int id;

  @observable
  String nome;

  @observable
  String descricao;

  @observable
  String srcLogo;

  @observable
  String srcLocalLogo;

  @observable
  int idEmpresa;

  @observable
  int qtdInstalacao;

  @observable
  int qtdInstalacaoFeita;

  _App({
    this.descricao,
    this.nome,
    this.srcLogo,
    this.srcLocalLogo,
    this.idEmpresa,
    this.qtdInstalacao,
    this.qtdInstalacaoFeita,
    this.id,
  });
}

class AppApi{
  Dio _dio = new Dio();

  Future<List<App>> listarAppsEmp(int idEmp,BuildContext context)async{
    Response response = await _dio.get("${Servidor.root}/app/listar",queryParameters: {'idEmp':idEmp}).catchError((erro){
      AlertUtil.alertErro(context, erro);
    });
    return AppList.fromJson(response.data).apps;
  }

  Future<App> listarApp(int idApp,BuildContext context)async{
    Response response = await _dio.get("${Servidor.root}/app/listarUm",queryParameters: {'idApp':idApp}).catchError((erro){
      AlertUtil.alertErro(context, erro);
    });
    return App.fromMap(response.data);
  }

}
