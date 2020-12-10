


abstract class IMediaService{


  Future<List> getRecommendedById(int id);
  Future<List> getTopRated(int page);
  Future<List> getPopular(int page);
  Future<List> search(String query);



  Future<List> getItems(Uri url);




}