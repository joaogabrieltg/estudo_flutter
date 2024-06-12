import 'package:estudo_flutter/modules/consulta_cep/data/datasource/cep_remote_datasource.dart';
import '../model/cep_model.dart';
import '../../domain/repository/cep_repository_interface.dart';

class CepRepository extends CepRepositoryInterface {
  final CepRemoteDatasourceInterface _cepRemoteDatasourceInterface;
  CepRepository(this._cepRemoteDatasourceInterface);
  @override
  Future<CepModel> getCep(String cep) async {
    return await _cepRemoteDatasourceInterface.getCep(cep);
  }
}