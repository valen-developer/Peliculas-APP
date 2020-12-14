import 'package:flutter/material.dart';

import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';

import 'package:peliculasApp/src/shared/presentation/ui/pages/home/widgets/favoriteMediaList/favoriteMediaList.widget.dart';

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
