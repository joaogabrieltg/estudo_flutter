import 'package:mobx/mobx.dart';

part 'cidade_estado_store.g.dart'; // Gere este arquivo com o comando: flutter packages pub run build_runner build

class CidadeEstadoStore = _CidadeEstadoStore with _$CidadeEstadoStore;

abstract class _CidadeEstadoStore with Store {
  @observable
  String? estadoSelecionado;

  @observable
  String? cidadeSelecionada;

  @observable
  List<String> cidades = [];

  @action
  void setEstadoSelecionado(String? novoEstado) {
    estadoSelecionado = novoEstado;
  }

  @action
  void setCidadeSelecionada(String? novaCidade) {
    cidadeSelecionada = novaCidade;
  }

  @action
  void setCidades(List<String> novasCidades) {
    cidades = novasCidades;
  }
}