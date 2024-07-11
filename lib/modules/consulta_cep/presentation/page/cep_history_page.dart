import 'package:flutter/material.dart';
import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/cep_history_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CepHistoryPage extends StatefulWidget {
  const CepHistoryPage({super.key});
  @override
  _CepHistoryPageState createState() => _CepHistoryPageState();
}

class _CepHistoryPageState extends State<CepHistoryPage> {
  List<Map<String, dynamic>> _ceps = [];
  final CepHistoryStore _cepHistoryStore = Modular.get<CepHistoryStore>();
  @override
  void initState() {
    super.initState();
    _loadCeps();
  }

  Future<void> _loadCeps() async {
    final ceps = await _cepHistoryStore.getCeps();
    setState(() {
      _ceps = ceps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de CEPs'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Histórico",
              style: TextStyle(
                color: Color(0XFF272727),
                fontFamily: 'Inter',
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _ceps.length,
              itemBuilder: (context, index) {
                final cep = _ceps[index];
                return Card(
  child: ListTile(
    title: Text(cep['cep'].toString()),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('CEP: ${cep['cep']}'),
        Text('Logradouro: ${cep['logradouro']}'),
        Text('Bairro: ${cep['bairro']}'),
        Text('Localidade: ${cep['localidade']}'),
        Text('UF: ${cep['uf']}'),
        Text('DDD: ${cep['ddd']}'),
      ],
    ),
    trailing: IconButton(
      icon: const Icon(Icons.auto_delete), // Escolha o ícone desejado
      onPressed: () {
        _cepHistoryStore.deleteCep(cep['cep']);
      },
    ),
  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
