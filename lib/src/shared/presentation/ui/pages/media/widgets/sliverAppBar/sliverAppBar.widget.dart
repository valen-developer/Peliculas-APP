import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/application/mediaFavorites.bloc.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class MediaSliverAppBar extends StatefulWidget {
  const MediaSliverAppBar({
    Key key,
    @required this.favoriteMediaBloc,
    @required this.media,
  }) : super(key: key);

  final MediaFavoritesBloc favoriteMediaBloc;
  final MediaModel media;

  @override
  _MediaSliverAppBarState createState() => _MediaSliverAppBarState();
}

class _MediaSliverAppBarState extends State<MediaSliverAppBar> {
  bool isMediaFavorite = false;

  @override
  void initState() {
    this._checkIfFavorite();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _checkIfFavorite() async {
    bool aux = await this
        .widget
        .favoriteMediaBloc
        .isFavorite(this.widget.media.id.value);

    setState(() {
      this.isMediaFavorite = aux;
    });
  }

  Future<bool> _onFavoritePressed() async {
    if (isMediaFavorite) {
      return await this
          .widget
          .favoriteMediaBloc
          .deleteById(this.widget.media.id.value);
    }

    return await this.widget.favoriteMediaBloc.save(this.widget.media);
  }

  Widget _buildSnackBar(bool done) {
    if (done) {
      return SnackBar(
        backgroundColor: (!isMediaFavorite) ? Colors.green : Colors.red,
        duration: const Duration(milliseconds: 400),
        content: Row(
          children: [
            Icon(
              (!isMediaFavorite) ? Icons.thumb_up : Icons.thumb_down,
            ),
            const SizedBox(width: 10),
            Text((!isMediaFavorite)
                ? 'Guardado en favoritos'
                : 'Borrado de favoritos'),
          ],
        ),
      );
    }

    return SnackBar(
      backgroundColor: Colors.grey,
      content: Text('No se ha podido realizado la operación'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final posterPathImageHeight = size.height * 0.2;
    final posterPathImageWidth = posterPathImageHeight * 0.8;
    final BorderRadius posterBorderRadius = BorderRadius.circular(20);

    final backdropPathImageHeight = size.height * 0.3;

    final expandedAppBarHeight =
        backdropPathImageHeight + (posterPathImageHeight / 2);

    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedAppBarHeight,
      collapsedHeight: size.height * 0.1,
      backgroundColor: Colors.transparent,
      flexibleSpace: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.3,
              child: ClipRRect(
                child: Image.network(
                  this.widget.media.backdropPath.valueWithHttp,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.3 - (posterPathImageHeight / 2),
            right: 30,
            child: Container(
              width: posterPathImageWidth,
              height: posterPathImageHeight,
              decoration: BoxDecoration(
                  borderRadius: posterBorderRadius,
                  boxShadow: [BoxShadow(blurRadius: 20)]),
              child: ClipRRect(
                borderRadius: posterBorderRadius,
                child: Hero(
                  tag: '${this.widget.media.id.value}',
                  child: Image.network(
                    this.widget.media.posterPath.valueWithHttp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: (isMediaFavorite)
              ? Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : Icon(Icons.favorite_outline),
          onPressed: () async {
            bool done = await this._onFavoritePressed();
            this._checkIfFavorite();
            Scaffold.of(context).showSnackBar(_buildSnackBar(done));
          },
        ),
      ],
    );
  }
}
