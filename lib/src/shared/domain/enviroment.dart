import 'package:peliculasApp/secret/secret.dart';

final enviroment = new _Enviroment();

class _Enviroment {
  bool production = false;
  String tmdbApiKey = secret['tmdbApiKey'];

  
}
