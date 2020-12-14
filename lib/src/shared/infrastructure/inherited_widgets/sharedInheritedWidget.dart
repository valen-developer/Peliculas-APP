import 'package:flutter/material.dart';

import 'package:peliculasApp/src/media/application/media.bloc.dart';
import 'package:peliculasApp/src/media/application/mediaFavorites.bloc.dart';

import 'package:peliculasApp/src/shared/application/router.bloc.dart';

class SharedInheritedWidget extends InheritedWidget {
  final Widget child;
  final RouterBloc routerBloc;
  final MediaBloc moviesBloc;
  final MediaBloc seriesBloc;

  final MediaFavoritesBloc moviesFavoritesBloc;
  final MediaFavoritesBloc seriesFavoritesBloc;

  SharedInheritedWidget(
      {@required this.child,
      @required this.routerBloc,
      @required this.moviesBloc,
      @required this.seriesBloc,
      @required this.moviesFavoritesBloc,
      @required this.seriesFavoritesBloc});

  static SharedInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
