import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_repository.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/page/busca_cep_page.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/user_case/busca_cep_case.dart';
import '../../shared/dio/use_dio.dart';

class ConsultaCepModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(UseDio.new);
    i.addLazySingleton<CepRepositoryInterface>(CepRepository.new);
    i.addLazySingleton(BuscaCepCase.new);
    i.addLazySingleton(BuscaCepStore.new);
  }
    @override
  void routes(r) {
    r.child('/',child: (context) => BuscaCepPage());
  }
}