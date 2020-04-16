import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';
import 'package:instalador_forca_de_vendas/widgets/alert_util.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'empresa.g.dart';

class Empresa extends _Empresa with _$Empresa {
  Empresa(
      {int id,
      String cnpj,
      String nomeFantasia,
      String razaoSocial,
      String token})
      : super(
            id: id,
            cnpj: cnpj,
            nomeFantasia: nomeFantasia,
            razaoSocial: razaoSocial,
            token: token);

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return new Empresa(
        id: json['id'],
        cnpj: json['cnpj'],
        nomeFantasia: json['nomeFantasia'],
        razaoSocial: json['razaoSocial'],
        token: json['token']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'cnpj': cnpj,
        'nomeFantasia': nomeFantasia,
        'razaoSocial': razaoSocial,
        'token': token
      };
}

abstract class _Empresa with Store {
  @observable
  int id;

  @observable
  String cnpj;

  @observable
  String nomeFantasia;

  @observable
  String razaoSocial;

  @observable
  String token;

  _Empresa(
      {this.id, this.cnpj, this.nomeFantasia, this.razaoSocial, this.token});
}

class EmpresaApi {
  Dio _dio = new Dio();

  Future<Empresa> fazerLogin(
      String cnpj, String cpf, BuildContext context) async {
    Response response = await _dio.get("${Servidor.root}/empresa/login",
        queryParameters: {'cpf': cpf, 'cnpj': cnpj}).catchError((erro) {
      DioError error = erro;
      AlertUtil.alertErro(context, error.message);
    });
    return Empresa.fromJson(response.data);
  }


}
