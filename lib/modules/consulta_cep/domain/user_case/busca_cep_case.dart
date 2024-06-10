import '../../data/model/cep_model.dart';
import '../repository/cep_repository_interface.dart';

class BuscaCepCase {
  final CepRepositoryInterface _cepRepositoryInterface;
  BuscaCepCase(this._cepRepositoryInterface);
  Future<CepModel> getCep(cep) async {
    try {
      final CepModel cepModel = await _cepRepositoryInterface.getCep(cep);
      return cepModel;
    } catch (e) {
      throw Exception('Erro ao fazer a requisição. Detalhes: $e');
    }
  }
}