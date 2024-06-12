import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_local_datasource.dart';
import '../model/cep_model.dart';
import '../../domain/repository/cep_db_repository_interface.dart';

class CepDbRepository extends CepDbRepositoryInterface {
  final CepLocalDatasourceInterface _cepLocalDatasourceInterface;
  CepDbRepository(this._cepLocalDatasourceInterface);
  @override
  Future<void> addToDatabase(Map<String, dynamic> cepData) {
    return _cepLocalDatasourceInterface.addToDatabase(cepData);
  }  
  @override
  Future<void> deleteCep(String cep) {
    return _cepLocalDatasourceInterface.deleteCep(cep);
  }
  @override
  Future<List<Map<String, dynamic>>> getCeps() {
    return _cepLocalDatasourceInterface.getCeps();
  }
  @override
  Future<CepModel> getFromDatabase(String cep) {
    return _cepLocalDatasourceInterface.getFromDatabase(cep);
  }
}