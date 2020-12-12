import 'package:flutter/material.dart';

import 'package:peliculasApp/src/media/application/media.bloc.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';

import 'package:peliculasApp/src/media/infrastucture/services/TMDB-services/TMDBService-Movies.dart';
import 'package:peliculasApp/src/media/infrastucture/services/TMDB-services/TMDBService-Series.dart';
import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';

import 'widgets/bodyHome.widget.dart';
import 'widgets/bottomNavigationBarWidget/bottomNavigationBar.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TMDBMoviesService tmdbMoviesService = new TMDBMoviesService();
    TMDBSeriesService tmdbSeriesService = new TMDBSeriesService();
    MediaBloc mediaBloc = new MediaBloc(tmdbMoviesService);
    MediaBloc seriesBloc = new MediaBloc(tmdbSeriesService);

    RouterBloc routerBloc = new RouterBloc();

    return SharedInheritedWidget(
      routerBloc: routerBloc,
      moviesBloc: mediaBloc,
      seriesBloc: seriesBloc,
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: BodyHomePage(),
      ),
    );
  }
}
