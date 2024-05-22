import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class useDio {
  useDio() : super();
  final Dio dio = Dio();
  Future<Response> getResponse(String url) async {
    final Response response = await dio.get(url);
    return response;
  }
}

class udeDioModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton((i) => useDio());
  }
}
