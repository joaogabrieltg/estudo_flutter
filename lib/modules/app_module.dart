import 'package:flutter_modular/flutter_modular.dart';
import 'home/presentation/home_page.dart';
import 'consulta_cep/presentation/busca_cep_page.dart';
import 'consulta_cep/data/cep_repository.dart';
import '../shared/dio/use_dio.dart';

class AppModule extends Module {
  @override
    void binds(i){
    i.add(useDio.new);
    i.add(CepRepository.new);
  }

  @override
    void routes(r) {
    r.child('/',child: (_,) =>HomePage());
    r.child('/busca_cep',child: (_,) =>BuscaCepPage());
  }
}