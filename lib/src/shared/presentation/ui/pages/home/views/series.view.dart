import 'package:flutter/material.dart';

import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/home/widgets/ListMedia/listMedia.dart';

class SeriesView extends StatefulWidget {
  @override
  _SeriesViewState createState() => _SeriesViewState();
}

class _SeriesViewState extends State<SeriesView> {
  bool firstinit = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final seriesBloc = SharedInheritedWidget.of(context).seriesBloc;
    if(this.firstinit) seriesBloc.clearData();
    this.firstinit = false;

    return ListMedia(mediaBloc: seriesBloc);
  }
}
