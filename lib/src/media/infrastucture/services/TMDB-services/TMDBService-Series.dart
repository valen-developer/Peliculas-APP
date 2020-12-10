import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculasApp/src/media/domain/interfaces/MediaServices.interface.dart';
import 'package:peliculasApp/src/media/infrastucture/services/TMDB-services/TMDBService.dart';

class TMDBSeriesService extends TMDBService implements IMediaService {
  @override
  Future<List> getPopular(int page) async {
    Map<String, String> queryParams = {
      ...this.generalQueryParams,
      'page': '$page'
    };

    Uri url = new Uri.https(this.tmdbApiUrl, '/3/tv/popular', queryParams);

    return await this.getItems(url);
  }

  @override
  Future<List> getRecommendedById(int id) async {
    Uri url = new Uri.https(
        this.tmdbApiUrl, '/3/tv/$id/recommendations', this.generalQueryParams);

    return await this.getItems(url);
  }

  @override
  Future<List> getTopRated(int page) async {
    Map<String, String> queryParams = {
      ...this.generalQueryParams,
      'page': '$page'
    };

    Uri url = new Uri.https(this.tmdbApiUrl, '/3/tv/popular', queryParams);

    return await this.getItems(url);
  }

  @override
  Future<List> search(String query) async {
    Map<String, String> queryParams = {
      ...this.generalQueryParams,
      'page': '1',
      'query': query
    };

    Uri url = new Uri.https(this.tmdbApiUrl, '/3/search/tv', queryParams);

    return await this.getItems(url);
  }

  @override
  Future<List> getItems(Uri url) async {
    try {
      http.Response resp = await http.get(url);
      if (resp.statusCode == 200) {
        var json = jsonDecode(resp.body);
        List jsonList = json['results'];
        return jsonList;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
