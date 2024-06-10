import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  String _displayText = '';

  Future<void> _confirmText() async {
    final String login = _textController.text;
    final String senha = _textController2.text;
    try {
      // TODO: Implementar o login e a autenticação
      setState(() {
        Modular.to.navigate('/home');
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
        title: const Text('Busca CEP'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'login',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _textController2,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'senha',
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _confirmText();
              },
              child: const Text(
                'Confirmar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              _displayText,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
