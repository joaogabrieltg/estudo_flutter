import 'package:flutter_modular/flutter_modular.dart';
import 'home/presentation/home_page.dart';
import 'consulta_cep/presentation/page/busca_cep_page.dart';
import 'consulta_cep/data/repository/cep_repository.dart';
import 'consulta_cep/domain/user_case/busca_cep_case.dart';
import 'login/presentation/login_page.dart';
import '../shared/dio/use_dio.dart';

class AppModule extends Module {
  @override
    void binds(i){
    i.add(useDio.new);
    i.add(CepRepository.new);
    i.add(BuscaCepCase.new);
  }

  @override
    void routes(r) {
    r.child('/',child: (_,) =>LoginPage());
    r.child('/home',child: (_,) =>HomePage());
    r.child('/busca_cep',child: (_,) =>BuscaCepPage());
  }
}