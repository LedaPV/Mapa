import 'package:flutter/material.dart';
import 'package:prueba2/main.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/primeraPantalla', //ruta principal
    routes: {
      '/primeraPantalla': (context) => MapsExample(),
    },
  ));
}
