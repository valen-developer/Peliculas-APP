import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/application/mediaFavorites.bloc.dart';

import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';
import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';

class MediaView extends StatelessWidget {
  const MediaView({
    Key key,
    @required this.media,
    @required this.routeFrom,
  }) : super(key: key);

  final MediaModel media;
  final Routes routeFrom;

  MediaFavoritesBloc _favoritesBlocByRoute(BuildContext context) {
    switch (this.routeFrom) {
      case Routes.movies:
        return SharedInheritedWidget.of(context).moviesFavoritesBloc;
        break;
      case Routes.series:
        return SharedInheritedWidget.of(context).seriesFavoritesBloc;
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final favoriteMediaBloc = this._favoritesBlocByRoute(context);

    return Container(
      color: Theme.of(context).backgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.7,
            flexibleSpace: FlexibleSpaceAppBar(media: this.media),
            actions: [
              FloatingActionButton(
                child: Icon(Icons.favorite),
                onPressed: () {
                  if (favoriteMediaBloc != null)
                    favoriteMediaBloc.save(this.media);
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Container(
                height: size.height,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FlexibleSpaceAppBar extends StatelessWidget {
  const FlexibleSpaceAppBar({Key key, @required this.media}) : super(key: key);
  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            width: size.width,
            height: size.height * 0.7,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
