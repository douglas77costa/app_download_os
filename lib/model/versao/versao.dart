import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';
import 'package:instalador_forca_de_vendas/widgets/alert_util.dart';
import 'package:mobx/mobx.dart';

part 'versao.g.dart';

class Versao extends _Versao with _$Versao {
  Versao(
      {String descricao,
      String srcApk,
      String srcApkLocal,
      String nome,
      String tamanhoApk,
      String status,
      int idApp,
      DateTime dataAtualizacao,
      int id})
      : super(
            descricao: descricao,
            srcApk: srcApk,
            srcApkLocal: srcApkLocal,
            nome: nome,
            tamanhoApk: tamanhoApk,
            status: status,
            idApp: idApp,
            dataAtualizacao: dataAtualizacao,
            id: id);

  factory Versao.fromMap(Map<String, dynamic> json) => Versao(
        descricao: json["descricao"],
        srcApk: json["srcApk"],
        srcApkLocal: json["srcApkLocal"],
        nome: json["nome"],
        tamanhoApk: json["tamanhoApk"],
        status: json["status"],
        idApp: json["idApp"],
        dataAtualizacao: DateTime.parse(json["dataAtualizacao"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "descricao": descricao,
        "srcApk": srcApk,
        "srcApkLocal": srcApkLocal,
        "nome": nome,
        "tamanhoApk": tamanhoApk,
        "status": status,
        "idApp": idApp,
        "dataAtualizacao":
            "${dataAtualizacao.year.toString().padLeft(4, '0')}-${dataAtualizacao.month.toString().padLeft(2, '0')}-${dataAtualizacao.day.toString().padLeft(2, '0')}",
        "id": id,
      };
}

abstract class _Versao with Store {
  @observable
  String descricao;

  @observable
  String srcApk;

  @observable
  String srcApkLocal;

  @observable
  String nome;

  @observable
  String tamanhoApk;

  @observable
  String status;

  @observable
  int idApp;

  @observable
  DateTime dataAtualizacao;

  @observable
  int id;

  _Versao({
    this.descricao,
    this.srcApk,
    this.srcApkLocal,
    this.nome,
    this.tamanhoApk,
    this.status,
    this.idApp,
    this.dataAtualizacao,
    this.id,
  });
}

class VersaoList {
  final List<Versao> versoes;

  VersaoList({
    this.versoes,
  });

  factory VersaoList.fromJson(List<dynamic> parsedJson) {

    List<Versao> versoes = new List<Versao>();
    versoes = parsedJson.map((i)=>Versao.fromMap(i)).toList();

    return new VersaoList(
        versoes: versoes
    );
  }
}

class VersaoApi{
  Dio _dio = new Dio();

  Future<List<Versao>> listarVersoesAtivas(int idApp, BuildContext context)async{
    Response response = await _dio.get("${Servidor.root}/versao/listarVersoesApp",queryParameters: {'idApp':idApp}).catchError((erro){
      AlertUtil.alertErro(context, erro);
    });
    return VersaoList.fromJson(response.data).versoes;
  }

}
