import 'package:peliculasApp/src/media/domain/interfaces/media.repository.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class FakeRepository implements IMediaRepository {
  @override
  Future<bool> deleteById(int id) async {
    return true;
  }

  @override
  Future<List> getAll() async {
    return [{}];
  }

  @override
  Future<bool> save(MediaModel media) async {
    return true;
  }
}
