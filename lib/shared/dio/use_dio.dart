import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UseDio {
  UseDio() : super();
  Future<Response> getResponse(String url) async {
    final Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
    }
  }
}

class UseDioModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton((i) => UseDio());
  }
}