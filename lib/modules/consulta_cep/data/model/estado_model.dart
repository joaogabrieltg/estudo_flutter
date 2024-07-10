import 'package:estudo_flutter/modules/consulta_cep/domain/entities/estado_entities.dart';

class EstadoModel extends EstadoEntity{
  final String sigla;
  final String nome;
  final List<String> cidades;

  EstadoModel({required this.sigla, required this.nome, required this.cidades}) : super(sigla: '', nome: '', cidades: []);

  factory EstadoModel.fromJson(Map<String, dynamic> json) {
    return EstadoModel(
      sigla: json['sigla'],
      nome: json['nome'],
      cidades: List<String>.from(json['cidades']),
    );
  }
}