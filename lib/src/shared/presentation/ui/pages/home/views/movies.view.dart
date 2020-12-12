import 'package:flutter/material.dart';

import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';

import 'package:peliculasApp/src/shared/presentation/ui/pages/home/widgets/ListMedia/listMedia.dart';

class Moviesview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesBloc = SharedInheritedWidget.of(context).moviesBloc;
    moviesBloc.clearData();
    return ListMedia(mediaBloc: moviesBloc);
  }
}
