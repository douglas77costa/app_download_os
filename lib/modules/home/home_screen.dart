import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:instalador_forca_de_vendas/modules/ajustes/ajustes_screen.dart';
import 'package:instalador_forca_de_vendas/modules/apps/app_controller.dart';
import 'package:instalador_forca_de_vendas/modules/apps/apps_screen.dart';
import 'package:instalador_forca_de_vendas/modules/downloads/downloads_screen.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:instalador_forca_de_vendas/modules/login/login_controller.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  var homeController = GetIt.I.get<HomeController>();
  var loginController = GetIt.I.get<LoginController>();
  var appController = GetIt.I.get<AppController>();
  static String tag = 'home-page';
  @override
  Widget build(BuildContext context) {
    appController.listarApps(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: ColorsTheme.azulEscuro,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        title: Observer(
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "${loginController.empresa.nomeFantasia}",
                  style: TextStyle(color: Colors.white),
                )
              ],
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) {
          switch (homeController.navBarController) {
            case NavBarItem.APPS:
              return AppsScreen();
            case NavBarItem.DOWNLOADS:
              return DownloadsScreen();
            case NavBarItem.AJUSTES:
              return AjustesScreen();
            default:
              return Container();
          }
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return CurvedNavigationBar(
            backgroundColor: Colors.white,
            buttonBackgroundColor: ColorsTheme.azulEscuro,
            color: ColorsTheme.azulEscuro,
            height: 60,
            animationDuration: Duration(milliseconds: 280),
            animationCurve: Curves.easeInOutCirc,
            //selectedIconTheme: IconThemeData(size: 28),
            //elevation: 5,
            // type: BottomNavigationBarType.fixed,
            // selectedItemColor: ColorsTheme.azulEscuro,
            //unselectedItemColor: Colors.black54,
            //currentIndex: homeController.navBarController.index,
            onTap: homeController.pickItem,
            items: [
              Icon(Icons.apps,size: 30,color: Colors.white,),
              Icon(Icons.file_download,size: 30,color: Colors.white),
              Icon(FontAwesomeIcons.cog,size: 30,color: Colors.white),
            ],
          );
        },
      ),
    );
  }
}
