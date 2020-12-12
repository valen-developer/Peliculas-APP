import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/application/media.bloc.dart';

import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

import 'package:peliculasApp/src/shared/presentation/ui/pages/home/widgets/CardMedia/cardMediaItem.dart';
import 'package:peliculasApp/src/shared/presentation/ui/shared/customError.widget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/shared/loading.widget.dart';

class ListMedia extends StatefulWidget {
  const ListMedia({Key key, @required this.mediaBloc}) : super(key: key);

  final MediaBloc mediaBloc;

  @override
  _ListMediaState createState() => _ListMediaState();
}

class _ListMediaState extends State<ListMedia> {
  ScrollController _scrollController;

  @override
  void initState() {
    this._scrollController = new ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    this._scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.widget.mediaBloc.getPopular();
    return StreamBuilder(
      stream: this.widget.mediaBloc.mediaStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) return CustomErrorWidget();
        if (!snapshot.hasData) return LoadingWidget();

        this._scrollController.addListener(() {
          if (_scrollController.offset ==
              _scrollController.position.maxScrollExtent) {
            this.widget.mediaBloc.getPopular();
          }
        });

        List<MediaModel> medias = snapshot.data;

        return ListView.builder(
          controller: this._scrollController,
          itemCount: medias.length,
          itemBuilder: (context, index) {
            return CustomCardWidget(media: medias[index]);
          },
        );
      },
    );
  }
}
