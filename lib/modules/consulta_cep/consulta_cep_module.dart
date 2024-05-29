import 'package:flutter_modular/flutter_modular.dart';
import 'domain/user_case/busca_cep_case.dart';
import '../../shared/dio/use_dio.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(useDio.new);
    i.add(BuscaCepCase.new);
  }
}
