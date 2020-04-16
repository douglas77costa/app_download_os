import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:instalador_forca_de_vendas/model/versao/versao.dart';
import 'package:instalador_forca_de_vendas/modules/apps/app_controller.dart';
import 'package:instalador_forca_de_vendas/modules/downloads/downloads_controller.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';

class CardVersaoItem extends StatelessWidget {
  final Versao versao;
  var appController = GetIt.I.get<AppController>();
  var downloadsController = GetIt.I.get<DownloadsController>();
  CardVersaoItem({this.versao});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: Color(0XFFECECEC))),
        elevation: 0,
        child: ConfigurableExpansionTile(
          initiallyExpanded: true,
          header: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Versão: ${versao.nome}",
                      style: TextStyle(
                        color: ColorsTheme.azulEscuro,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 10),
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(7.0),
                          side: BorderSide(color: ColorsTheme.azulClaro)),
                      color: Colors.white,
                      textColor: ColorsTheme.azulClaro,
                      child: Observer(builder: (_){
                        if(downloadsController.progresso==0){
                          return Text("Baixar".toUpperCase(),
                              style: TextStyle(fontSize: 14));
                        }else if(downloadsController.progresso>0 && downloadsController.progresso<100){
                          return SpinKitWave(
                            size: 20,
                            color: ColorsTheme.azulClaro,
                          );
                        }else if(downloadsController.progresso==100){
                          return Text("Instalar".toUpperCase(),
                              style: TextStyle(fontSize: 14));
                        }
                        return Container();
                      }),
                      onPressed: () {
                        downloadsController.downloadApp(context);
                      },
                    ),
                  )
                ],
              )),
          children: [
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20,top: 5,bottom: 10),
                  child: Text(
                    versao.descricao,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: ColorsTheme.cinzaTexto
                    ),
                  ),
                )
              ],
            ),
            // + more params, see example !!
          ],
        ),
      ),
    );
  }
}
