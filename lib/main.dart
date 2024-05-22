import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/app_module.dart';
import 'modules/presentation/app_widget.dart';

void main(){
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}