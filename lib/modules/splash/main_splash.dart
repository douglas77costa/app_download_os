import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:instalador_forca_de_vendas/modules/downloads/downloads_controller.dart';
import 'package:instalador_forca_de_vendas/modules/login/login_screen.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';
import 'package:instalador_forca_de_vendas/widgets/splashscreen.dart';
import 'package:instalador_forca_de_vendas/modules/login/login_controller.dart';

class MainSplash extends StatefulWidget {
  @override
  _MainSplashState createState() => _MainSplashState();
}

class _MainSplashState extends State<MainSplash> {
  static String tag = 'screen-page';
  final loginController = GetIt.I.get<LoginController>();

  @override
  void initState() {
    // TODO: implement initState
    setPage();
    super.initState();
  }

  setPage() async {
    await loginController.verificarLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Observer(
          builder: (_) {
            return SplashScreen(
              seconds: 5,
              navigateAfterSeconds: loginController.page,
              backgroundColor: Colors.white,
              image: Image.asset(
                "images/logo_os_alt.png",
                width: 500,
              ),
              loaderColor: Colors.blue,
              title: Text(
                "App Download OS",
                style: TextStyle(fontSize: 30, color: ColorsTheme.azulEscuro),
              ),
              photoSize: 100.0,
              loadingText: Text(
                "Carregando dados...",
                style: TextStyle(color: Colors.black38),
              ),
            );
          },
        ),
        onWillPop: () async => false
    );
  }
}
