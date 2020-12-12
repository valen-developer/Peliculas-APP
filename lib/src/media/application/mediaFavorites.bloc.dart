import 'package:peliculasApp/src/media/domain/interfaces/media.repository.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class MediaFavoritesBloc {
  IMediaRepository _iMediaRepository;

  List<MediaModel> medias = [];

  MediaFavoritesBloc(this._iMediaRepository);

  Future<bool> save(MediaModel media) async {
    if (media == null) return false;

    this.medias.add(media);
    return await this._iMediaRepository.save(media);
  }
}
