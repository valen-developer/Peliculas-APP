import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';

import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/home/views/favorites.view.dart';

import 'package:peliculasApp/src/shared/presentation/ui/pages/home/views/movies.view.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/home/views/series.view.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _BodyHomePageState createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation1;

  @override
  void initState() {
    this._animationController = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));

    this._animation1 =
        CurveTween(curve: Interval(0, 1)).animate(this._animationController);

    this._animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    this._animationController?.dispose();
    super.dispose();
  }

  Widget _router(Routes route) {
    switch (route) {
      case Routes.movies:
        return Moviesview();
        break;
      case Routes.series:
        return SeriesView();
        break;
      case Routes.favorites:
        return FavoritesView();
        break;
      default:
        return Moviesview();
    }
  }

  void _resetAnimation() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final routerBloc = SharedInheritedWidget.of(context).routerBloc;
    return AnimatedBuilder(
      animation: routerBloc,
      builder: (context, child) {
        this._resetAnimation();
        return FadeTransition(
          opacity: this._animation1,
          child: _router(routerBloc.currentRoute),
        );
      },
    );
  }
}
