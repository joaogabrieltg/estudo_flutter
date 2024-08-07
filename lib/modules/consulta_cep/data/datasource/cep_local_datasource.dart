import 'dart:convert';
import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart';
import 'package:estudo_flutter/modules/consulta_cep/data/model/estado_model.dart';
import 'package:estudo_flutter/shared/database/database.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

abstract class CepLocalDatasourceInterface {
  Future<void> addToDatabase(Map<String, dynamic> cepData);
  Future<CepModel> getFromDatabase(String cep);
  Future<List<Map<String, dynamic>>> getCeps();
  Future<List<EstadoModel>> carregarEstadosCidades();
  Future<void> deleteCep(String cep);
}

class CepLocalDatasource extends CepLocalDatasourceInterface {
  CepDatabase cepDatabase = CepDatabase();
  @override
  Future<void> addToDatabase(Map<String, dynamic> cepData) async {
    final db = await cepDatabase.getDatabase();
    await db.insert(
      'CEP',
      cepData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<EstadoModel>> carregarEstadosCidades() async {
    //enviar pra data
    String response = await rootBundle
        .loadString('lib/shared/assets/data/estados_cidades.json');
    var data = json.decode(response);
    List<EstadoModel> estados =
        (data['estados'] as List).map((i) => EstadoModel.fromJson(i)).toList();
    return estados;
  }

  @override
  Future<CepModel> getFromDatabase(String cep) async {
    final db = await cepDatabase.getDatabase();
    final List<Map<String, dynamic>> cepData =
        await db.query('CEP', where: 'cep = ?', whereArgs: [cep]);
    CepModel cepModel = cepData.removeAt(0) as CepModel;
    return cepModel;
  }

  @override
  Future<List<Map<String, dynamic>>> getCeps() async {
    final db = await cepDatabase.getDatabase();
    return await db.query('CEP');
  }

  @override
  Future<void> deleteCep(String cep) async {
    final db = await cepDatabase.getDatabase();
    await db.delete('CEP', where: 'cep = ?', whereArgs: [cep]);
  }
}
