import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/application/mediaFavorites.bloc.dart';

import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';
import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/media/widgets/sliverAppBar/sliverAppBar.widget.dart';

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

    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          slivers: [
            MediaSliverAppBar(
                favoriteMediaBloc: favoriteMediaBloc, media: media),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Container(
                  height: size.height,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
