import '../../domain/user_case/busca_cep_case.dart';
import '../../data/model/cep_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
//todo implementar o store (use_case -> stores -> pages)

class BuscaCepStore {
  final BuscaCepCase _buscaCepCase;
  BuscaCepStore(this._buscaCepCase);
  Future<String> getText(cep) async {
    final CepModel cepModel = await _buscaCepCase.getCep(cep);
    final cepData = {
      'cep': cep,
      'logradouro': cepModel.logradouro,
      'bairro': cepModel.bairro,
      'localidade': cepModel.localidade,
      'uf': cepModel.uf,
      'ddd': cepModel.ddd,
    };
    _buscaCepCase.addToDatabase(cepData);
    return 'Logradouro: ${cepModel.logradouro}\nBairro: ${cepModel.bairro}\nLocalidade: ${cepModel.localidade}\nUF: ${cepModel.uf}\nDDD: ${cepModel.ddd}';
  }

  Future<List<Estado>> carregarEstadosCidades() async {
    String response = await rootBundle.loadString('lib/shared/assets/data/estados_cidades.json');
    var data = json.decode(response);
    List<Estado> estados =
        (data['estados'] as List).map((i) => Estado.fromJson(i)).toList();
    return estados;
  }
}

class Estado {
  final String sigla;
  final String nome;
  final List<String> cidades;

  Estado({required this.sigla, required this.nome, required this.cidades});

  factory Estado.fromJson(Map<String, dynamic> json) {
    return Estado(
      sigla: json['sigla'],
      nome: json['nome'],
      cidades: List<String>.from(json['cidades']),
    );
  }
}
