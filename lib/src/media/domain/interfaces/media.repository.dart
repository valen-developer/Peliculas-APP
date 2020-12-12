import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

abstract class IMediaRepository {
  Future<bool> save(MediaModel media);
  Future<List> getAll();
  Future<bool> deleteById(int id);
}
