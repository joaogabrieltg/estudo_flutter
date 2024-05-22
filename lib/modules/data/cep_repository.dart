import 'package:dio/dio.dart';
import '../../shared/dio/use_dio.dart';
import '../domain/cep_model.dart';

class CepRepository {
  final useDio _dio = useDio();
  Future<CepModel> getCep(String cep) async {
    final Response response = await _dio.getResponse('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      return CepModel.fromJson(response.data);
    } else {
      throw Exception(
          'Erro ao fazer a requisição. Código de status: ${response.statusCode}');
    }
  }
}
