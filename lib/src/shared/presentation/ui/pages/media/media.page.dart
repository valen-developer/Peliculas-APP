import 'package:flutter/material.dart';

import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

import 'package:peliculasApp/src/media/application/media.bloc.dart';
import 'package:peliculasApp/src/media/application/mediaFavorites.bloc.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';

import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';

import 'package:peliculasApp/src/shared/presentation/ui/pages/media/widgets/bodySection/bodySection.widget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/media/widgets/recommendedMediaList/recommendMediaList.widget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/media/widgets/sliverAppBar/sliverAppBar.widget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/shared/customError.widget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/shared/loading.widget.dart';

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

  MediaBloc _mediaBlocByRoute(BuildContext context) {
    switch (this.routeFrom) {
      case Routes.movies:
        return SharedInheritedWidget.of(context).moviesBloc;
        break;
      case Routes.series:
        return SharedInheritedWidget.of(context).seriesBloc;
        break;
      default:
        return SharedInheritedWidget.of(context).moviesBloc;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMediaBloc = this._favoritesBlocByRoute(context);
    final mediaBloc = this._mediaBlocByRoute(context);
    final size = MediaQuery.of(context).size;
    
    print(favoriteMediaBloc);
    print(mediaBloc);


    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: CustomScrollView(
          slivers: [
            MediaSliverAppBar(
                favoriteMediaBloc: favoriteMediaBloc, media: media),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodySectionWidget(media: media),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Si te ha gustado ...',
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            .copyWith(color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height * 0.3,
                      child: FutureBuilder(
                        future: mediaBloc.getRecommendByID(this.media.id.value),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) return CustomErrorWidget();
                          if (!snapshot.hasData) return LoadingWidget();

                          List<MediaModel> medias = snapshot.data;

                          return RecommendedMediaList(medias: medias);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
