import 'package:flutter/material.dart';

import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';

import 'package:peliculasApp/src/shared/presentation/ui/pages/home/widgets/ListMedia/listMedia.dart';

class Moviesview extends StatefulWidget {
  @override
  _MoviesviewState createState() => _MoviesviewState();
}

class _MoviesviewState extends State<Moviesview> {
  bool firstInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final moviesBloc = SharedInheritedWidget.of(context).moviesBloc;
    if (firstInit) moviesBloc.clearData();
    this.firstInit = false;

    return ListMedia(mediaBloc: moviesBloc);
  }
}
