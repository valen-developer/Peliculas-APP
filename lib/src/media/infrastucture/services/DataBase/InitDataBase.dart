import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sqflite/sqlite_api.dart';

class InitMediaDataBase {
  Database _db;
  String _databaseName;

  Database get db => this._db;

  InitMediaDataBase(this._databaseName);

  Future<bool> openDB() async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, '${this._databaseName}.db');

      this._db = await openDatabase(
        path,
        version: 1,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
