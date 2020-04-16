import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';
import 'package:instalador_forca_de_vendas/modules/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  static String tag = 'login-page';
  var cpfController = new MaskedTextController(mask: '000.000.000-00');
  var cnpjController = new MaskedTextController(mask: '00.000.000/0000-00');
  var loginController = GetIt.I.get<LoginController>();
  GlobalKey _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 50),
            children: <Widget>[
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 100.0,
                  child: Image.asset('images/logo_os_alt.png'),
                ),
              ),
              SizedBox(height: 48.0),
              Observer(
                builder: (_) {
                  return TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    onChanged: loginController.validarCnpj,
                    controller: cnpjController,
                    decoration: InputDecoration(
                        hintText: 'CNPJ',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        errorText: loginController.validateCnpj),
                  );
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                onChanged: loginController.validarCpf,
                controller: cpfController,
                decoration: InputDecoration(
                    hintText: 'CPF',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    errorText: loginController.validateCpf),
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    //Navigator.of(context).pushNamed();
                    loginController.login(context, _globalKey);
                  },
                  padding: EdgeInsets.all(12),
                  color: ColorsTheme.azulClaro,
                  child: loginController.loading.loadingController
                      ? SpinKitCircle(
                          color: Colors.white,
                        )
                      : Text('Entrar', style: TextStyle(color: Colors.white)),
                ),
              ),
              FlatButton(
                child: Text(
                  'Problemas com o acesso?',
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
