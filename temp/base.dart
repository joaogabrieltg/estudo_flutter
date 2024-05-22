import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuscaCEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busca CEP'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuscaCepPage()),
              );
            },
            child: Text(
              'Buscar CEP',
              style: TextStyle(fontSize: 24.0, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              minimumSize: Size(double.infinity, 60.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuscaCepPage extends StatefulWidget {
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  final TextEditingController _textController = TextEditingController();
  String _displayText = '';

  Future<void> _confirmText() async {
    final String cep = _textController.text;
    final String url = 'https://viacep.com.br/ws/$cep/json/';
    final dio = Dio();
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.toString());
      final String logradouro = jsonData['logradouro'];
      final String bairro = jsonData['bairro'];
      final String localidade = jsonData['localidade'];
      final String uf = jsonData['uf'];
      final String ddd = jsonData['ddd'];

      setState(() {
        _displayText = 'Logradouro: $logradouro\nBairro: $bairro\nLocalidade: $localidade\nUF: $uf\nDDD: $ddd';
      });
    } else {
      setState(() {
        _displayText = 'Erro ao fazer a requisição. Código de status: ${response.statusCode}';
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