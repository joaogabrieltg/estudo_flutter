import 'package:dio/dio.dart';
import '../../../../shared/dio/use_dio.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart';
//o import do dio fica aqui
abstract class CepRemoteDatasourceInterface {
  Future<CepModel> getCep(String cep);
}

class CepRemoteDatasource extends CepRemoteDatasourceInterface {
  final UseDio _dio = UseDio();
  @override
  Future<CepModel> getCep(String cep) async {
    final regex = RegExp(r'^[0-9]{8}');
    if(!regex.hasMatch(cep)) {
      throw Exception('CEP inválido');
    }
    final Response response = await _dio.getResponse('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      return CepModel.fromJson(response.data);
    } else {
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
    }
  }
}