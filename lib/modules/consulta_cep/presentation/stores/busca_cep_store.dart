import '../../domain/user_case/busca_cep_case.dart';
import '../../data/model/cep_model.dart';
//todo implementar o store (use_case -> stores -> pages)

class BuscaCepStore {
  final _buscaCepCase =BuscaCepCase();
  Future<String> getText(cep) async {
    final CepModel cepModel = await _buscaCepCase.getCep(cep);
    return 'Logradouro: ${cepModel.logradouro}\nBairro: ${cepModel.bairro}\nLocalidade: ${cepModel.localidade}\nUF: ${cepModel.uf}\nDDD: ${cepModel.ddd}';
  }
}
