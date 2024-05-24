class CepModel {
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;

  CepModel({
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      logradouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
      ddd: json['ddd'] ?? '',
    );
  }
}