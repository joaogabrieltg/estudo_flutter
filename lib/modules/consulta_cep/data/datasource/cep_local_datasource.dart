import 'package:estudo_flutter/modules/consulta_cep/data/model/cep_model.dart';
import 'package:estudo_flutter/shared/database/database.dart';
import 'package:sqflite/sqflite.dart';

abstract class CepLocalDatasourceInterface {
  Future<void> addToDatabase(Map<String, Object> cepData);
  Future<CepModel> getFromDatabase(String cep);
  Future<List<Map<String, dynamic>>> getCeps();
  Future<void> deleteCep(String cep);
}

class CepLocalDatasource extends CepLocalDatasourceInterface {
  CepDatabase cepDatabase = CepDatabase();
  @override
  Future<void> addToDatabase(Map<String, Object> cepData) async {
    final db = await cepDatabase.getDatabase();
    await db.insert(
      'CEP',
      cepData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
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
