import '../../data/model/cep_model.dart';
import '../repository/cep_repository_interface.dart';
import '../repository/cep_db_repository_interface.dart';

class BuscaCepCase {
  final CepRepositoryInterface _cepRepositoryInterface;
  final CepDbRepositoryInterface _cepDbRepositoryInterface;

  BuscaCepCase(this._cepRepositoryInterface, this._cepDbRepositoryInterface);
  Future<CepModel> getCep(cep) async {
    try {
      final CepModel cepModel = await _cepRepositoryInterface.getCep(cep);
      return cepModel;
    } catch (e) {
      throw Exception('Erro ao fazer a requisição. Detalhes: $e');
    }
  }
  Future<void> addToDatabase(Map<String, dynamic> cepData){
    return _cepDbRepositoryInterface.addToDatabase(cepData);
  }
}