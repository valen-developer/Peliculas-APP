import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/utils/utils.dart';

class CreateTable {
  CreateTable();

  createDefaultTable(Database db, String tableName) async {
    if (!(await this._tableExist(db, tableName)))
      _createTable(
        db,
        'CREATE TABLE $tableName (' +
            'id INTEGER PRIMARY KEY, ' +
            'title VARCHAR ,' +
            'vote_average NUMBER, ' +
            'vote_count INTEGER, ' +
            'backdrop_path VARCHAR, ' +
            'poster_path VARCHAR, ' +
            'overview TEXT)',
      );
  }

  createCustomTable(Database db, String tableName, String query) async {
    if (!(await this._tableExist(db, tableName))) this._createTable(db, query);
  }

  Future<bool> _tableExist(Database db, String tableName) async {
    int count = firstIntValue(
      await db.query(
        'sqlite_master',
        columns: ['COUNT(*)'],
        where: 'type = ? AND name = ?',
        whereArgs: ['table', tableName],
      ),
    );
    return count > 0;
  }

  _createTable(Database database, String query) async {
    await database.execute(query);
  }
}
