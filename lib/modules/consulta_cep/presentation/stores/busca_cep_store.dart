import 'package:estudo_flutter/modules/consulta_cep/domain/entities/cep_entities.dart';
import 'package:estudo_flutter/modules/consulta_cep/domain/entities/estado_entities.dart';
import '../../domain/user_case/busca_cep_case.dart';
//todo implementar o store (use_case -> stores -> pages)

class BuscaCepStore {
  final BuscaCepCase _buscaCepCase;
  BuscaCepStore(this._buscaCepCase);
  Future<String> getText(cep) async {
    final CepEntity cepModel = await _buscaCepCase.getCep(cep);
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

    Future<List<String>> getList(cep) async {
    final List<CepEntity> cepModel = await _buscaCepCase.getCepList(cep);
    List<String> cepDataList = [];
    for (var cep in cepModel) {
      final cepData = {
        'cep': cep.cep,
        'logradouro': cep.logradouro,
        'bairro': cep.bairro,
        'localidade': cep.localidade,
        'uf': cep.uf,
        'ddd': cep.ddd,
      };
      cepDataList.add('CEP: ${cep.cep}\nLogradouro: ${cep.logradouro}\nBairro: ${cep.bairro}\nLocalidade: ${cep.localidade}\nUF: ${cep.uf}\nDDD: ${cep.ddd}\n\n');
      _buscaCepCase.addToDatabase(cepData);
    }
    return cepDataList;
  }
  Future<List<EstadoEntity>> carregarEstadosCidades() async { //enviar pra data
    final List<EstadoEntity> estados = await _buscaCepCase.carregarEstadosCidades();
    return estados;
  }
}