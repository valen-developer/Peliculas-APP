import 'package:flutter/material.dart';

import 'package:peliculasApp/src/media/application/media.bloc.dart';
import 'package:peliculasApp/src/media/application/mediaFavorites.bloc.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';

import 'package:peliculasApp/src/media/infrastucture/repositories/media.repository.dart';
import 'package:peliculasApp/src/media/infrastucture/services/DataBase/InitDataBase.dart';
import 'package:peliculasApp/src/media/infrastucture/services/TMDB-services/TMDBService-Movies.dart';
import 'package:peliculasApp/src/media/infrastucture/services/TMDB-services/TMDBService-Series.dart';
import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';

import 'package:peliculasApp/src/shared/presentation/themes/main.theme.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/home/home.page.dart';
import 'package:peliculasApp/src/shared/presentation/ui/shared/loading.widget.dart';

const String databaseName = 'MoviesApp';
const String seriesTableName = 'series';
const String moviesTableName = 'movies';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildApp();
  }
}

class BuildApp extends StatefulWidget {
  @override
  _BuildAppState createState() => _BuildAppState();
}

class _BuildAppState extends State<BuildApp> {
  Widget app = LoadingWidget();

  @override
  void initState() {
    this._buildApp();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _buildApp() async {
    TMDBMoviesService tmdbMoviesService = new TMDBMoviesService();
    TMDBSeriesService tmdbSeriesService = new TMDBSeriesService();

    //Open DB
    InitMediaDataBase database = InitMediaDataBase(databaseName);
    await database.openDB();

    //Build Repositories
    MediaRepositorySQFLite moviesRepository =
        new MediaRepositorySQFLite(database.db, moviesTableName);
    MediaRepositorySQFLite seriesRepository =
        new MediaRepositorySQFLite(database.db, seriesTableName);

    //Build Blocs
    MediaBloc moviesBloc = new MediaBloc(tmdbMoviesService);
    MediaBloc seriesBloc = new MediaBloc(tmdbSeriesService);

    RouterBloc routerBloc = new RouterBloc();
    
    MediaFavoritesBloc moviesFavoritesBloc =
        new MediaFavoritesBloc(moviesRepository);
    MediaFavoritesBloc seriesFavoritesBloc =
        new MediaFavoritesBloc(seriesRepository);

    setState(() {
      app = SharedInheritedWidget(
        moviesBloc: moviesBloc,
        seriesBloc: seriesBloc,
        moviesFavoritesBloc: moviesFavoritesBloc,
        seriesFavoritesBloc: seriesFavoritesBloc,
        routerBloc: routerBloc,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: mainTheme,
          title: 'Movies App',
          home: HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return app;
  }
}
