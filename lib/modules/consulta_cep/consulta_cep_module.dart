import 'package:flutter_modular/flutter_modular.dart';
import 'data/cep_repository.dart';
import '../../shared/dio/use_dio.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(useDio.new);
    i.add(CepRepository.new);
  }
}
