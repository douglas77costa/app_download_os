import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';
import 'package:instalador_forca_de_vendas/widgets/card_app_item.dart';


import 'app_controller.dart';

class AppsScreen extends StatelessWidget {
  var appController = GetIt.I.get<AppController>();
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Flexible(
          child: Observer(
            builder: (_) {
              if (appController.loading.loadingController) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: ColorsTheme.azulClaro,
                  ),
                );
              } else {
                return RefreshIndicator(
                  child: ListView.builder(
                    itemCount: appController.listaApp.length,
                    itemBuilder: (_, index) {
                      var app = appController.listaApp[index];
                      return CardAppItem(
                        app: app,
                      );
                    }),
                    onRefresh: (){
                      appController.listarApps(context);
                    },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
