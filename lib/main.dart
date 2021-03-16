import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_app/AppModule.dart';
import 'package:search_app/AppWidget.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
