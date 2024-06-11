import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/user_case/cep_history_case.dart';

class CepHistoryStore{
  final CepHistoryCase _cepHistoryCase;
  CepHistoryStore(this._cepHistoryCase);
  Future<void> addToDatabase(Map<String, Object> cepData){
    return _cepHistoryCase.addToDatabase(cepData);
  }
  Future<CepModel> getFromDatabase(String cep){
    return _cepHistoryCase.getFromDatabase(cep);
  }
  Future<List<Map<String, dynamic>>> getCeps(){
    return _cepHistoryCase.getCeps();
  }
  Future<void> deleteCep(String cep){
    return _cepHistoryCase.deleteCep(cep);
  }
}