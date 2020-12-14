import 'package:flutter/material.dart';

import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';

import 'package:peliculasApp/src/shared/presentation/ui/pages/home/widgets/favoriteMediaList/favoriteList.widget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/shared/customError.widget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/shared/loading.widget.dart';

class FavoriteMediaList extends StatelessWidget {
  const FavoriteMediaList(
      {Key key,
      @required this.future,
      @required this.title,
      @required this.route})
      : super(key: key);
  final Future<List<MediaModel>> future;
  final String title;
  final Routes route;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              this.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const SizedBox(height: 10),
          FutureBuilder(
            future: this.future,
            builder: (context, snapshot) {
              if (snapshot.hasError) return CustomErrorWidget();
              if (!snapshot.hasData) return LoadingWidget();

              List<MediaModel> medias = snapshot.data;

              if (medias.length == 0) return Container();

              return FavoriteListWidget(
                medias: medias,
                route: this.route,
              );
            },
          ),
        ],
      ),
    );
  }
}
