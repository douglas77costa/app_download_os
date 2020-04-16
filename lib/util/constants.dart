

import 'package:flutter/material.dart';

//Cores thema
abstract class ColorsTheme{
  static final Color azulPadrao = Color(0xFF3f83bd);
  static final Color azulClaro = Color(0xFF0ca9e1);
  static final Color azulEscuro = Color(0xFF2f559e);
  static final Color cinzaTexto = Color(0xFF666666);
}

abstract class Servidor{
  static final String root = "http://192.168.0.13:8050/api.appdownload";
}
