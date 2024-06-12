import '../../domain/user_case/busca_cep_case.dart';
import '../../data/model/cep_model.dart';
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
}
