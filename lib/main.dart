
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:instalador_forca_de_vendas/model/app/app.dart';
import 'package:instalador_forca_de_vendas/model/empresa/empresa.dart';
import 'package:instalador_forca_de_vendas/model/vendedor/vendedor.dart';
import 'package:instalador_forca_de_vendas/modules/downloads/downloads_controller.dart';
import 'package:instalador_forca_de_vendas/modules/error/error_screen.dart';
import 'package:instalador_forca_de_vendas/modules/home/home_screen.dart';
import 'package:instalador_forca_de_vendas/modules/info_app/info_app_screen.dart';
import 'package:instalador_forca_de_vendas/modules/login/login_screen.dart';
import 'package:instalador_forca_de_vendas/modules/login/login_controller.dart';
import 'package:instalador_forca_de_vendas/modules/splash/main_splash.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';

import 'modules/apps/app_controller.dart';
import 'modules/home/home_controller.dart';
import 'modules/loading/loading_controller.dart';


void main(){
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<App>(App());
  getIt.registerSingleton<Vendedor>(Vendedor());
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<Loading>(Loading());
  getIt.registerSingleton<Empresa>(Empresa());
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<AppController>(AppController());
  getIt.registerSingleton<DownloadsController>(DownloadsController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static String tag = "my-app";

  final routes = <String, WidgetBuilder>{
    LoginScreen.tag: (context) => LoginScreen(),
    HomeScreen.tag: (context) => HomeScreen(),
    InfoAppScreen.tag: (context) => InfoAppScreen(),
    ErrorScreen.tag: (context)=>ErrorScreen(),
    MyApp.tag:(context)=>MyApp(),
  };

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));*/
    var downloadsController = GetIt.I.get<DownloadsController>();
    downloadsController.initServiceDownload();
    return MaterialApp(
      title: 'App Download OS',
      theme: ThemeData(
        primaryColor: ColorsTheme.azulPadrao,
        accentColor: ColorsTheme.azulClaro,
        fontFamily: 'Product Sans',
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light
        )
      ),
      debugShowCheckedModeBanner: false,
      home: MainSplash(),
      routes: routes,
    );
  }
}
