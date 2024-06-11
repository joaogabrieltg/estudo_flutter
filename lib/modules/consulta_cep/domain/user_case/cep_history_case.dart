import '../../data/model/cep_model.dart';
import '../repository/cep_db_repository_interface.dart';

class CepHistoryCase {
  final CepDbRepositoryInterface _cepDbRepositoryInterface;
  CepHistoryCase(this._cepDbRepositoryInterface);
  Future<void> addToDatabase(Map<String, Object> cepData){
    return _cepDbRepositoryInterface.addToDatabase(cepData);
  }
  Future<CepModel> getFromDatabase(String cep){
    return _cepDbRepositoryInterface.getFromDatabase(cep);
  }
  Future<List<Map<String, dynamic>>> getCeps(){
    return _cepDbRepositoryInterface.getCeps();
  }
  Future<void> deleteCep(String cep){
    return _cepDbRepositoryInterface.deleteCep(cep);
  }
}