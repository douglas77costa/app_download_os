import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:instalador_forca_de_vendas/modules/apps/app_controller.dart';
import 'package:instalador_forca_de_vendas/modules/downloads/downloads_controller.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:instalador_forca_de_vendas/widgets/card_versao_item.dart';
import 'package:line_icons/line_icons.dart';

class InfoAppScreen extends StatelessWidget {
  var appController = GetIt.I.get<AppController>();
  var downloadsController = GetIt.I.get<DownloadsController>();
  static String tag = 'info-app-page';
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (appController.loading.loadingController) {
          return Scaffold(
            body: Center(
              child: SpinKitFadingCircle(
                color: ColorsTheme.azulClaro,
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: GradientAppBar(
              brightness: Brightness.dark,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "${appController.app.nome}",
                style: TextStyle(fontSize: 30),
              ),
              backgroundColorEnd: ColorsTheme.azulPadrao,
              backgroundColorStart: ColorsTheme.azulEscuro,
            ),
            //backgroundColor: Color(0XFFEDF1F4),
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                          ColorsTheme.azulPadrao,
                          ColorsTheme.azulEscuro
                        ])),
                    child: Center(
                        child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: CachedNetworkImage(
                        imageUrl: "${appController.app.srcLogo}",
                        width: 100,
                        placeholder: (context, url) => SpinKitFadingCircle(
                          color: ColorsTheme.azulClaro,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )),
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                    child: Container(
                      height: 70,
                      child: Card(
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Text("${appController.app.descricao}",textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      ),
                    )),
                Divider(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    LineIcons.download,
                                    color: ColorsTheme.azulEscuro,
                                    size: 25,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${appController.app.qtdInstalacaoFeita}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Downloads \n Feitos",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorsTheme.cinzaTexto
                                    ),
                                    )
                              ],
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            top: 20, right: 10, bottom: 10, left: 20),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    LineIcons.mobile_phone,
                                    color: ColorsTheme.azulEscuro,
                                    size: 25,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${appController.app.qtdInstalacaoFeita}/${appController.app.qtdInstalacao}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Instalações \nrealizadas",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorsTheme.cinzaTexto
                                    ),)
                              ],
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            top: 20, right: 10, bottom: 10, left: 20),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    LineIcons.pie_chart,
                                    color: ColorsTheme.azulEscuro,
                                    size: 25,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${appController.listaVersao.first.tamanhoApk} MB"
                                    "",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Tamanho \n APK",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorsTheme.cinzaTexto
                                    )
                                )
                              ],
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            top: 20, right: 10, bottom: 10, left: 20),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Observer(builder: (_){
                 if(downloadsController.progresso==0){
                   return Container();
                 }else if(downloadsController.progresso>0 && downloadsController.progresso<100){
                   return RoundedProgressBar(
                     height: 5,
                     style: RoundedProgressBarStyle(
                         borderWidth: 0,
                         widthShadow: 0),
                     margin: EdgeInsets.symmetric(vertical: 16),
                     borderRadius: BorderRadius.circular(0),
                     percent: downloadsController.progresso,
                   );
                 }else if(downloadsController.progresso ==100){
                   return Container();
                 }
                 return Container();
                }),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Observer(
                    builder: (_) {
                      if (appController.loading.loadingController) {
                        return Center(
                          child: SpinKitWave(
                            size: 10,
                            color: ColorsTheme.azulClaro,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: appController.listaVersao.length,
                            itemBuilder: (_, index) {
                              var versao = appController.listaVersao[index];
                              return CardVersaoItem(
                                versao: versao,
                              );
                            });
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        }
      },
    );
  }
}
