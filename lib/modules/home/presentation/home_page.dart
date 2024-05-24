import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
              Modular.to.pushNamed('/busca_cep');
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