import 'package:mobx/mobx.dart';

part 'cep_data_store.g.dart'; // Gere este arquivo com o comando: flutter packages pub run build_runner build

class CepDataStore = _CepDataStore with _$CepDataStore;

abstract class _CepDataStore with Store {
  @observable
  List<Map<String,dynamic>> ceps = [];

  @action
  void setCeps(List<Map<String,dynamic>> cepList) {
    ceps = cepList;
  }
}