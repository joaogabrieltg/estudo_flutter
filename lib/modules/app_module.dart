import 'package:estudo_flutter/modules/consulta_cep/consulta_cep_module.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_local_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_remote_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_db_repository.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_db_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/user_case/cep_history_case.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/cep_history_store.dart';
import 'package:estudo_flutter/modules/home/home_module.dart';
import 'package:estudo_flutter/modules/login/login_module.dart';
import 'package:estudo_flutter/modules/user/user_module.dart';
import 'package:estudo_flutter/shared/database/database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'consulta_cep/presentation/stores/busca_cep_store.dart';
import 'consulta_cep/data/repository/cep_repository.dart';
import 'consulta_cep/domain/user_case/busca_cep_case.dart';
import '../shared/dio/use_dio.dart';
import '../shared/mobx/loading_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(LoadingStore.new);
    i.add(CepDatabase.new);
    i.add(UseDio.new);
    i.addLazySingleton<CepLocalDatasourceInterface>(CepLocalDatasource.new);
    i.addLazySingleton<CepRemoteDatasourceInterface>(CepRemoteDatasource.new);
    i.addLazySingleton<CepRepositoryInterface>(CepRepository.new);
    i.addLazySingleton<CepDbRepositoryInterface>(CepDbRepository.new);
    i.add(BuscaCepCase.new);
    i.add(BuscaCepStore.new);
    i.add(CepHistoryStore.new);
    i.add(CepHistoryCase.new);
  }

  @override
  void routes(r) {
    r.module('/', module: LoginModule());
    r.module('/home/', module: HomeModule());
    r.module('/busca_cep/', module: ConsultaCepModule());
    r.module('/user', module: UserModule());
    //home (access app) -> check login (->) login/signin (firebase?) -> busca cep (busca/user) -> user(logout/edit/delete/history) -> history
  }
}
