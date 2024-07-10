class CepEntity {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;

  CepEntity({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });
}