import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:instalador_forca_de_vendas/model/app/app.dart';
import 'package:instalador_forca_de_vendas/modules/apps/app_controller.dart';
import 'package:instalador_forca_de_vendas/util/constants.dart';

class CardAppItem extends StatelessWidget {
  final App app;
  var appController = GetIt.I.get<AppController>();
  CardAppItem({this.app});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color:  Color(0XFFECECEC))),
        elevation: 0,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 100,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: "${app.srcLogo}",
                placeholder: (context, url) => SpinKitFadingCircle(
                  color: ColorsTheme.azulClaro,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "${app.nome}",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 20, color: ColorsTheme.azulPadrao),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    width: 210,
                  ),
                  Container(
                    child: Text(
                      "Instalções dísponiveis: ${app.qtdInstalacaoFeita} / ${app.qtdInstalacao}",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.black38),
                    ),
                    margin: EdgeInsets.only(top: 5),
                    width: 210,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(7.0),
                              side: BorderSide(color: ColorsTheme.azulClaro)),
                          color: Colors.white,
                          textColor: ColorsTheme.azulClaro,
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "+ Sobre".toUpperCase(),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          onPressed: () async{
                            await appController.infoApp(app.id, context);
                          },
                        ),
                        SizedBox(width: 10),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(7.0),
                              side: BorderSide(color: ColorsTheme.azulClaro)),
                          onPressed: () {},
                          color: ColorsTheme.azulClaro,
                          textColor: Colors.white,
                          child: Text("Instalar".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
