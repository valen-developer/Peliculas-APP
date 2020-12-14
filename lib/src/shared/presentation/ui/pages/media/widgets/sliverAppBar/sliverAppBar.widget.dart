import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/application/mediaFavorites.bloc.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/media/widgets/sliverAppBar/appBarButton.widget.dart';

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

    final headerBorderRadius = BorderRadius.only(
        bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30));

    return SliverAppBar(
      pinned: true,
      expandedHeight: size.height * 0.6,
      collapsedHeight: size.height * 0.1,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        child: ClipRRect(
          borderRadius: headerBorderRadius,
          child: Hero(
            tag: '${this.widget.media.id.value}',
            child: Image.network(
              this.widget.media.posterPath.valueWithHttp,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
      leading: AppBarButton(
        icon: Icon(Icons.keyboard_arrow_left, size: 45),
        margin: const EdgeInsets.only(left: 3),
        padding: 0,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        AppBarButton(
          icon: Icon(
            (isMediaFavorite) ? Icons.favorite : Icons.favorite_outline,
            color: (isMediaFavorite) ? Colors.red : Colors.white,
          ),
          margin: const EdgeInsets.only(right: 3),
          onTap: () async {
            bool done = await this._onFavoritePressed();
            this._checkIfFavorite();
            Scaffold.of(context).showSnackBar(
              _buildSnackBar(done),
            );
          },
        ),
      ],
    );
  }
}
