import 'package:flutter/material.dart';

import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';


import 'package:peliculasApp/src/shared/presentation/ui/pages/media/media.page.dart';

class FavoriteListWidget extends StatelessWidget {
  const FavoriteListWidget({
    Key key,
    @required this.medias,
    @required this.route,
  }) : super(key: key);

  final List<MediaModel> medias;
  final Routes route;

  _navigate(BuildContext context, MediaModel media) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: MediaView(
              media: media,
              routeFrom: this.route,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: medias.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final BorderRadius cardBorderRadius = BorderRadius.circular(20);

          return Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: cardBorderRadius,
            ),
            child: InkWell(
              onTap: () {
                this._navigate(context, medias[index]);
              },
              borderRadius: cardBorderRadius,
              child: ClipRRect(
                borderRadius: cardBorderRadius,
                child: FadeInImage(
                  placeholder: AssetImage('assets/img/loading.png'),
                  image: NetworkImage(
                    medias[index].posterPath.valueWithHttp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
