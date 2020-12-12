import 'dart:async';

import 'package:peliculasApp/src/media/domain/interfaces/MediaServices.interface.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class MediaBloc {
  IMediaService _iMediaService;

  MediaBloc(this._iMediaService);

  List<MediaModel> _media = [];
  bool _loading = false;
  int _page = 0;

  StreamController _mediaStreamController =
      new StreamController<List<MediaModel>>.broadcast();
  Stream get mediaStream => this._mediaStreamController.stream;

  void dispose() {
    this._mediaStreamController?.close();
    this.clearData();
  }

  Future<List<MediaModel>> getPopular() async {
    if (this._loading) return [];

    _loading = true;
    _page++;

    List jsonList = await this._iMediaService.getPopular(this._page);
    this._media.addAll(MediaModelList.fromJsonList(jsonList).medias);
    this._mediaStreamController.sink.add(this._media);
    _loading = false;
  }

  void clearData() {
    _page = 0;
    _media = [];
  }
}
