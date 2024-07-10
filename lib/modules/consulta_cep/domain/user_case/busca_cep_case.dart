import 'package:estudo_flutter/modules/consulta_cep/domain/entities/cep_entities.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/entities/estado_entities.dart';

import '../repository/cep_repository_interface.dart';
import '../repository/cep_db_repository_interface.dart';

class BuscaCepCase {
  final CepRepositoryInterface _cepRepositoryInterface;
  final CepDbRepositoryInterface _cepDbRepositoryInterface;

  BuscaCepCase(this._cepRepositoryInterface, this._cepDbRepositoryInterface);
  Future<CepEntity> getCep(cep) async {
    try {
      final CepEntity cepEntity = await _cepRepositoryInterface.getCep(cep);
      return cepEntity;
    } catch (e) {
      throw Exception('Erro ao fazer a requisição. Detalhes: $e');
    }
  }
  Future<List<CepEntity>> getCepList(cep) async {
    try {
      final List<CepEntity> cepEntity = await _cepRepositoryInterface.getCepList(cep);
      return cepEntity;
    } catch (e) {
      throw Exception('Erro ao fazer a requisição. Detalhes: $e');
    }
  }
  Future<void> addToDatabase(Map<String, dynamic> cepData){
    return _cepDbRepositoryInterface.addToDatabase(cepData);
  }
    Future<List<EstadoEntity>> carregarEstadosCidades(){
    return _cepDbRepositoryInterface.carregarEstadosCidades();
    }

}