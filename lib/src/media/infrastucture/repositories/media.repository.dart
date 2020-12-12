import 'package:peliculasApp/src/media/domain/interfaces/media.repository.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';
import 'package:sqflite/sqlite_api.dart';

class MediaRepositorySQFLite implements IMediaRepository {
  Database _db;
  String _tableName;

  MediaRepositorySQFLite(this._db, this._tableName);

  @override
  Future<List> getAll() async {
    try {
      List<Map> medias =
          await this._db.rawQuery('SELECT * from ${this._tableName}');
      return medias;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> save(MediaModel media) async {
    int rows = 0;

    rows = await this._db.insert(this._tableName, media.toJson());

    if (rows > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> deleteById(int id) async {
    int rows = 0;

    rows = await this
        ._db
        .delete(this._tableName, where: 'id = ?', whereArgs: ['$id']);
    return (rows == 0) ? false : true;
  }
}
