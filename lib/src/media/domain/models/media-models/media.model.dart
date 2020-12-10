import 'package:peliculasApp/src/media/domain/models/media-models/valueObjects/mediaImagePath.valueObject.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/valueObjects/mediaId.valueObject.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/valueObjects/mediaOverview.valueObject.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/valueObjects/mediaTitle.valueObject.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/valueObjects/mediaVoteAverage.valueObject.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/valueObjects/mediaVoteCount.valueObject.dart';

class MediaModelList {
  List<MediaModel> medias = [];

  MediaModelList.fromJsonList(List jsonList) {
    for (var json in jsonList) {
      medias.add(MediaModel.fromJson(json));
    }
  }
}

class MediaModel {
  MediaModel({
    this.voteAverage,
    this.id,
    this.voteCount,
    this.title,
    this.backdropPath,
    this.posterPath,
    this.overview,
  });

  MediaId id;
  MediaTitle title;
  MediaOverview overview;
  MediaVoteCount voteCount;
  MediaImagePath posterPath;
  MediaImagePath backdropPath;
  MediaVoteAverage voteAverage;


  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        title: new MediaTitle(
            (json["title"] != null) ? json["title"] : json["name"]),
        voteAverage: new MediaVoteAverage(json["vote_average"].toDouble()),
        id: new MediaId(json["id"]),
        voteCount: new MediaVoteCount(json["vote_count"]),
        overview: new MediaOverview(json["overview"]),
        backdropPath: new MediaImagePath(json["backdrop_path"]),
        posterPath: new MediaImagePath(json["poster_path"]),
      );

  Map<String, dynamic> toJson() => {
        "vote_average": voteAverage.value,
        "id": id.value,
        "vote_count": voteCount.value,
        "title": title.value,
        "backdrop_path": backdropPath.value,
        "poster_path": posterPath.value,
        "overview": overview.value,
      };
}
