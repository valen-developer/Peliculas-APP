import 'package:flutter/material.dart';
import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/home/widgets/ListMedia/listMedia.dart';

class SeriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final seriesBloc = SharedInheritedWidget.of(context).seriesBloc;
    seriesBloc.clearData();
    return ListMedia(mediaBloc: seriesBloc);
  }
}
