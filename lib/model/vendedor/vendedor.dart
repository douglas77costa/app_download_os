import 'package:mobx/mobx.dart';

part 'vendedor.g.dart';

class Vendedor extends _Vendedor with _$Vendedor {
  Vendedor({int id, String cpf, String cnpj})
      : super(id: id, cpf: cpf, cnpj: cnpj);

  factory Vendedor.fromJson(Map<String, dynamic> json) {
    return new Vendedor(id: json['id'], cpf: json['cpf'], cnpj: json['cnpj']);
  }
  Map<String, dynamic> toJson() => {'id': id, 'cpf': cpf, 'cnpj': cnpj};
}

abstract class _Vendedor with Store {
  @observable
  int id;

  @observable
  String cpf ="";

  @observable
  String cnpj ="";

  @action
  setId(int nId) => this.id = nId;

  @action
  setCpf(String nCpf) => this.cpf = nCpf;

  @action
  setCnpj(String nCnpj) => this.cnpj = nCnpj;

  _Vendedor({
    this.id,
    this.cnpj,
    this.cpf,
  });
}
