import 'package:dio/dio.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart';
//o import do dio fica aqui
abstract class CepDatasource {
  Future<CepModel> getCep(String cep);
}

class _CepDatasource implements CepDatasource {
  Future<CepModel> getCep(String cep) async {
    
  }
}
