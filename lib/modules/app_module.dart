import 'package:estudo_flutter/modules/consulta_cep/consulta_cep_module.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_repository_interface.dart';
import 'package:estudo_flutter/modules/home/home_module.dart';
import 'package:estudo_flutter/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'consulta_cep/presentation/stores/busca_cep_store.dart';
import 'consulta_cep/data/repository/cep_repository.dart';
import 'consulta_cep/domain/user_case/busca_cep_case.dart';
import '../shared/dio/use_dio.dart';
import '../shared/mobx/loading_store.dart';

class AppModule extends Module {
  @override
    void binds(i){
    i.add(LoadingStore.new);
    i.add(UseDio.new);
    i.addLazySingleton<CepRepositoryInterface>(CepRepository.new);
    i.add(BuscaCepCase.new);
    i.add(BuscaCepStore.new);
  }

  @override
    void routes(r) {
    r.module('/',module: LoginModule());
    r.module('/home',module: HomeModule());
    r.module('/busca_cep',module: ConsultaCepModule());
  }
}