import 'package:sqflite/sqflite.dart';

class CepDatabase {
  Future<Database> getDatabase() async {
    return openDatabase(
      'database.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE CEP (cep TEXT PRIMARY KEY, logradouro TEXT, bairro TEXT, localidade TEXT, uf TEXT, ddd TEXT)');
      },
    );
  }
}
