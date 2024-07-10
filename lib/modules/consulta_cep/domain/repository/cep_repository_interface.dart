import 'package:estudo_flutter/modules/consulta_cep/domain/entities/cep_entities.dart';

abstract class CepRepositoryInterface {
  Future<CepEntity> getCep(String cep);
  Future<List<CepEntity>> getCepList(String cep);
}
