import '../../data/repository/cep_repository.dart';
import '../../data/model/cep_model.dart';

class BuscaCepCase {
  final _cepRepository = CepRepository();
  Future<CepModel> getCep(cep) async {
    try {
      final CepModel cepModel = await _cepRepository.getCep(cep);
      return cepModel;
    } catch (e) {
      throw Exception('Erro ao fazer a requisição. Detalhes: $e');
    }
  }
}