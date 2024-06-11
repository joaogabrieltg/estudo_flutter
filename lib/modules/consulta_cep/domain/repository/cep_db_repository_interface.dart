import '../../data/model/cep_model.dart';

abstract class CepDbRepositoryInterface {
  Future<void> addToDatabase(Map<String, Object> cepData);
  Future<CepModel> getFromDatabase(String cep);
  Future<List<Map<String, dynamic>>> getCeps();
  Future<void> deleteCep(String cep);
}