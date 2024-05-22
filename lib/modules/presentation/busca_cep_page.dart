import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../data/cep_repository.dart';
import '../domain/cep_model.dart';

class BuscaCepPage extends StatefulWidget {
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  final TextEditingController _textController = TextEditingController();
  String _displayText = '';
  final CepRepository _cepRepository = Modular.get<CepRepository>();

  Future<void> _confirmText() async {
    final String cep = _textController.text;
    try {
      final CepModel cepModel = await _cepRepository.getCep(cep);
      setState(() {
        _displayText = 'Logradouro: ${cepModel.logradouro}\nBairro: ${cepModel.bairro}\nLocalidade: ${cepModel.localidade}\nUF: ${cepModel.uf}\nDDD: ${cepModel.ddd}';
      });
    } catch (e) {
      setState(() {
        _displayText = 'Erro ao fazer a requisição. Detalhes: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busca CEP'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Digite um CEP',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _confirmText,
              child: Text(
                'Confirmar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              _displayText,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}