import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';
import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/shared/customError.widget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/shared/loading.widget.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesFavoritesBloc =
        SharedInheritedWidget.of(context).moviesFavoritesBloc;
    final seriesFavoritesBloc =
        SharedInheritedWidget.of(context).seriesFavoritesBloc;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FavoriteMediaList(
          future: moviesFavoritesBloc.getAll(),
          title: 'Películas',
        ),
        FavoriteMediaList(
          future: seriesFavoritesBloc.getAll(),
          title: 'Series y TV',
        ),
      ],
    );
  }
}

class FavoriteMediaList extends StatelessWidget {
  const FavoriteMediaList(
      {Key key, @required this.future, @required this.title})
      : super(key: key);
  final Future<List<MediaModel>> future;
  final String title;

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
            child: Text(
              this.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          FutureBuilder(
            future: this.future,
            builder: (context, snapshot) {
              if (snapshot.hasError) return CustomErrorWidget();
              if (!snapshot.hasData) return LoadingWidget();

              List<MediaModel> medias = snapshot.data;

              if (medias.length == 0) return Container();

              for (MediaModel item in medias) {
                print(item.title.value);
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: medias.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final BorderRadius cardBorderRadius =
                        BorderRadius.circular(20);

                    return Container(
                      width: size.width * 0.2,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: cardBorderRadius,
                      ),
                      child: ClipRRect(
                        borderRadius: cardBorderRadius,
                        child: FadeInImage(
                          placeholder: AssetImage('assets/img/loading.png'),
                          image: NetworkImage(
                            medias[index].posterPath.valueWithHttp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
