import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instalador_forca_de_vendas/main.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';

class ErrorScreen extends StatelessWidget {
  static String tag = 'error-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Sem conexão com internet!",style: TextStyle(color: ColorsTheme.azulEscuro,fontSize: 25),),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Fique online para acessar o app",style: TextStyle(color: ColorsTheme.azulPadrao,fontSize: 20),)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 170,
                  height: 170,
                  child: FlareActor("assets/wifi-pulso.flr",animation: 'desconect',)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'my-app');
                  },
                  padding: EdgeInsets.all(12),
                  color: ColorsTheme.azulPadrao,
                  child: Text('Tentar novamente', style: TextStyle(color: Colors.white,fontSize: 17))
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
