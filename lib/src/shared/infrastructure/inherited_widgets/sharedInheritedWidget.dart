import 'package:flutter/material.dart';

import 'package:peliculasApp/src/shared/application/router.bloc.dart';

class SharedInheritedWidget extends InheritedWidget {
  final Widget child;
  final RouterBloc routerBloc;

  SharedInheritedWidget({@required this.child, @required this.routerBloc});

  static SharedInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
