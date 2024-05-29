import 'package:dio/dio.dart';
import '../../../../shared/dio/use_dio.dart';
import '../model/cep_model.dart';
import '../../domain/repository/cep_repository_interface.dart';

class CepRepository extends CepRepositoryInterface{
  final useDio _dio = useDio();
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
