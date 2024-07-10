import 'package:estudo_flutter/modules/consulta_cep/domain/entities/cep_entities.dart';

class CepModel extends CepEntity{
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;

  CepModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  }) : super(cep: '', logradouro: '', bairro: '', localidade: '', uf: '', ddd: '');

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: json['cep'] ?? '',
      logradouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
      ddd: json['ddd'] ?? '',
    );
  }
}