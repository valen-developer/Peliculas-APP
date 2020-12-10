import 'package:flutter/material.dart';

import 'package:peliculasApp/src/shared/application/router.bloc.dart';
import 'package:peliculasApp/src/shared/presentation/ui/widgets/bottomNavigationBarWidget/bottomNavigationBarItem.widget.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: kBottomNavigationBarHeight,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavigatorBarItem(
            title: 'Películas',
            icon: Icons.movie_creation_outlined,
            route: Routes.movies,
          ),
          BottomNavigatorBarItem(
            title: 'Series y TV',
            icon: Icons.tv_outlined,
            route: Routes.series,
          ),
          BottomNavigatorBarItem(
            title: 'Favoritos',
            icon: Icons.favorite_outline,
            route: Routes.favorites,
          ),
        ],
      ),
    );
  }
}
