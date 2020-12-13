import 'package:peliculasApp/src/media/domain/interfaces/media.repository.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class MediaFavoritesBloc {
  IMediaRepository _iMediaRepository;

  List<MediaModel> _medias = [];

  MediaFavoritesBloc(this._iMediaRepository);

  Future<bool> save(MediaModel media) async {
    if (media == null) return false;

    this._medias.add(media);
    return await this._iMediaRepository.save(media);
  }

  Future<List<MediaModel>> getAll() async {
    List jsonList = await this._iMediaRepository.getAll();

    List<MediaModel> medias = MediaModelList.fromJsonList(jsonList).medias;
    if (this._medias.length == 0) this._medias.addAll(medias);
    return this._medias;
  }

  Future<bool> deleteById(int id) async {
    return await this._iMediaRepository.deleteById(id);
  }
}
