import '../../data/model/cep_model.dart';

abstract class CepRepositoryInterface {
  Future<CepModel> getCep(String cep);
  Future<List<CepModel>> getCepList(String cep);
}