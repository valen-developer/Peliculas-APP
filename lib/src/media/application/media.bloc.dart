import 'package:peliculasApp/src/media/domain/interfaces/MediaServices.interface.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class MediaBloc {
  IMediaService _iMediaService;

  MediaBloc(this._iMediaService);

  bool _loading = false;
  int _page = 0;

  Future<List<MediaModel>> getPopular() async {
    if (this._loading) return [];

    _loading = true;
    _page++;

    List jsonList = await this._iMediaService.getPopular(this._page);

    return MediaModelList.fromJsonList(jsonList).medias;
  }

  void clearData() {
    _page = 0;
  }
}
