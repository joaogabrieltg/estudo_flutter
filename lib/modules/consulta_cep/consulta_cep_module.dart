import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_local_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_remote_datasource.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_db_repository.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/repository/cep_repository.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_db_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/repository/cep_repository_interface.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/user_case/cep_history_case.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/page/busca_cep_page.dart';
//import 'package:estudo_flutter/modules/consulta_cep/presentation/page/busca_cep_page_old.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/page/cep_history_page.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/cep_history_store.dart';
import 'package:estudo_flutter/shared/database/database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/user_case/busca_cep_case.dart';
import '../../shared/dio/use_dio.dart';

class ConsultaCepModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(UseDio.new);
    i.addLazySingleton(CepDatabase.new);
    i.addLazySingleton<CepLocalDatasourceInterface>(CepLocalDatasource.new);
    i.addLazySingleton<CepRemoteDatasourceInterface>(CepRemoteDatasource.new);
    i.addLazySingleton<CepRepositoryInterface>(CepRepository.new);
    i.addLazySingleton<CepDbRepositoryInterface>(CepDbRepository.new);
    i.addLazySingleton(BuscaCepCase.new);
    i.addLazySingleton(BuscaCepStore.new);
    i.addLazySingleton(CepHistoryStore.new);
    i.addLazySingleton(CepHistoryCase.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => BuscaCepPage());
    r.child('/history', child: (context) => CepHistoryPage());
  }
}