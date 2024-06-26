import 'package:flutter/material.dart';
import '../stores/busca_cep_store.dart';
import '../../../../shared/mobx/loading_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BuscaCepPage extends StatefulWidget {
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  final loadingStore = LoadingStore();
  final TextEditingController _textController = TextEditingController();
  String _displayText = '';
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();

  Future<void> _confirmText() async {
    loadingStore.isLoading = true;
    final String cep = _textController.text;
    try {
      final String cepText = await _buscaCepStore.getText(cep);
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        loadingStore.isLoading = false;
        _displayText = cepText;
      });
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        loadingStore.isLoading = false;
        _displayText = 'Erro ao fazer a requisição. Detalhes: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Digite um CEP',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _confirmText,
              child: const Text(
                'Confirmar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16.0),
            Observer(builder: (_) {
              if (loadingStore.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Text(
                  _displayText,
                  style: const TextStyle(fontSize: 16.0),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
