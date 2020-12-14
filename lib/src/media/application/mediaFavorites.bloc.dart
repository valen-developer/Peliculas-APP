import 'package:peliculasApp/src/media/domain/interfaces/media.repository.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class MediaFavoritesBloc {
  IMediaRepository _iMediaRepository;

  List<MediaModel> _medias = [];

  MediaFavoritesBloc(this._iMediaRepository);

  Future<bool> save(MediaModel media) async {
    if (media == null) return false;

    if (await this.isFavorite(media.id.value)) return false;

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
    if (await this._deleteMedia(id))
      return await this._iMediaRepository.deleteById(id);

    return false;
  }

  Future<bool> isFavorite(int id) async {
    bool isIn = false;

    if (this._medias.length == 0) await this.getAll();

    for (MediaModel media in this._medias) {
      if (media.id.value == id) {
        isIn = true;
        break;
      }
    }

    return isIn;
  }

  Future<bool> _deleteMedia(int id) async {
    if (await isFavorite(id)) {
      List<MediaModel> aux = [];
      for (MediaModel media in this._medias) {
        if (!(media.id.value == id)) aux.add(media);
      }
      this._medias = aux;
      return true;
    }
    return false;
  }
}
