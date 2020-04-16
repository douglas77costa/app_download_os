import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'loading_controller.g.dart';

class Loading = LoadingController with _$Loading;

abstract class LoadingController with Store{

  @observable
  bool loadingController = false;

  @action
  setLoading(bool load)=> loadingController = load;

  Future<bool> verificarConexao(_scaffoldKey) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      if(_scaffoldKey!=null){
        final snackBar = SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 5,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 5),
          backgroundColor: Colors.black,
          content: Text(
            'Erro ao se conectar! \n Verifique sua conexão com a internet!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        return false;
      }
      return false;
    }
  }

}
