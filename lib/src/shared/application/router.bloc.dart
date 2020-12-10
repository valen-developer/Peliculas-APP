import 'package:flutter/foundation.dart';

enum Routes { movies, series, favorites }

class RouterBloc extends ChangeNotifier {
  Routes _currentRoute = Routes.movies;

  Routes get currentRoute => this._currentRoute;

  void changeRoute(Routes newRoute) {
    this._currentRoute = newRoute;
    notifyListeners();
  }
}
