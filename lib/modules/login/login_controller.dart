import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:instalador_forca_de_vendas/model/vendedor/vendedor.dart';
import 'package:instalador_forca_de_vendas/modules/loading/loading_controller.dart';
import 'package:instalador_forca_de_vendas/widgets/alert_util.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:instalador_forca_de_vendas/model/empresa/empresa.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final vendedor = Vendedor();
  final apiEmp = EmpresaApi();
  final loading = Loading();
  Empresa empresa = Empresa();

  @observable
  var validateCnpj = null;

  @observable
  var validateCpf = null;

  @observable
  String page = '';

  @action
  validarCnpj(String cnpj) {
    vendedor.setCnpj(cnpj);
    if (vendedor.cnpj == null) {
      validateCnpj = "CNPJ inválido";
    } else if (vendedor.cnpj.length < 18) {
      validateCnpj = "CNPJ inválido";
    }else if(!CNPJValidator.isValid(cnpj)){
      validateCnpj = "CNPJ inválido";
    }
    else {
      validateCnpj = null;
    }
  }

  @action
  validarCpf(String cpf){
    vendedor.setCpf(cpf);
    if(cpf == null){
      validateCpf = "CPF Inválido";
    }else{
      validateCpf = null;
    }
  }


  @action
  Future login(BuildContext context,GlobalKey _globalKey)async{
    loading.setLoading(true);
    if(await loading.verificarConexao(_globalKey)){
      await apiEmp.fazerLogin(vendedor.cnpj,vendedor.cpf, context).then((_empresa)async{
        if(_empresa.id == null){
          AlertUtil.alertErro(context, "Empresa não existe na base de dados");
        }else{
          await _salvarLogin();
          empresa = _empresa;
          Navigator.pushNamed(context, 'home-page');
        }
      }).whenComplete((){
        loading.setLoading(false);
      });
    }
    loading.setLoading(false);
  }

  @action
  Future _salvarLogin()async{
    SharedPreferences dados = await SharedPreferences.getInstance();
    dados.setString("cpf", vendedor.cpf);
    dados.setString("cnpj", vendedor.cnpj);
  }

  @action
  Future verificarLogin(BuildContext context)async{
    SharedPreferences dados = await SharedPreferences.getInstance();

    if(dados.getString("cpf")==null&&dados.getString("cnpj")==null){
      print("001");
      page = 'login-page';
    }else{
      if(await loading.verificarConexao(null)){
        await apiEmp.fazerLogin(dados.getString("cnpj"),dados.getString("cpf"), context).then((_empresa){
          if(_empresa.id == null){
            AlertUtil.alertErro(context, "Empresa não existe na base de dados");
            print("002");
            page ='login-page';
          }else{
            print("003");
            empresa = _empresa;
            page = 'home-page';
          }
        });
      }else{
        page = 'error-page';
      }
    }

  }

}
