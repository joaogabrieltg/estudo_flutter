import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/home_page.dart';
import 'presentation/busca_cep_page.dart';
import 'data/cep_repository.dart';
import '../shared/dio/use_dio.dart';

class AppModule extends Module {
  @override
    void exportedBinds(i){
    i.addSingleton(CepRepository.new);
    i.addSingleton(useDio.new);
  }

  @override
    void routes(r) {
    r.child('/',child: (_,) =>HomePage());
    r.child('/busca_cep',child: (_,) =>BuscaCepPage());
  }
}