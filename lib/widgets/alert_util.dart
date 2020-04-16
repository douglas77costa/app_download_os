import 'package:flutter/material.dart';
import 'package:instalador_forca_de_vendas/main.dart';
import 'package:instalador_forca_de_vendas/widgets/splashscreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertUtil {
  static void alertErro(BuildContext context, String msg) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "ERRO!",
      desc: msg,
      style: AlertStyle(
        isCloseButton: false,
        animationType: AnimationType.grow
      ),
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }
  static void alertErroConexao(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "ERRO!",
      desc: "Sem conexão com a internet!",
      style: AlertStyle(
          isCloseButton: false,
          animationType: AnimationType.grow
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Tentar novamente",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
          },
          width: 200,
        )
      ],
    ).show();
  }
  static void alertWarning(BuildContext context, String msg){
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Atenção",
      desc: msg,
      style: AlertStyle(
        isCloseButton: false,
        animationType: AnimationType.grow
      ),
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }
}
