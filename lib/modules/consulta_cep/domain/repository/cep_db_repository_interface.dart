import 'package:estudo_flutter/modules/consulta_cep/domain/entities/estado_entities.dart';
import '../../data/model/cep_model.dart';

abstract class CepDbRepositoryInterface {
  Future<void> addToDatabase(Map<String, dynamic> cepData);
  Future<CepModel> getFromDatabase(String cep);
  Future<List<Map<String, dynamic>>> getCeps();
  Future<void> deleteCep(String cep);
  Future<List<EstadoEntity>> carregarEstadosCidades();
}