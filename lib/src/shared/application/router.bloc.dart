import 'package:flutter/foundation.dart';

enum Routes { movies, series, favorites }

class RouterBloc extends ChangeNotifier {
  Routes _currentRoute = Routes.movies;
  Routes _oldRoute = Routes.movies;

  Routes get currentRoute => this._currentRoute;
  Routes get oldRoute => this._oldRoute;

  void changeRoute(Routes newRoute) {
    this._oldRoute = this._currentRoute;
    this._currentRoute = newRoute;
    notifyListeners();
  }

  bool hasChangedRoute() {
    print('antigua: ${this.oldRoute} nueva: ${this.currentRoute}');

    if (this._currentRoute != this._oldRoute) return true;
    return false;
  }
}
