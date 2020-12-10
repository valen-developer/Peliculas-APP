import 'package:peliculasApp/src/shared/domain/enviroment.dart';

abstract class TMDBService {
  String tmdbApiUrl = 'api.themoviedb.org';

  Map<String, String> generalQueryParams = {
    'api_key': enviroment.tmdbApiKey,
    'language': 'es-ES'
  };
}
