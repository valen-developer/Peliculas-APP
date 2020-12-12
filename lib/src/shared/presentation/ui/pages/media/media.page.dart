import 'package:flutter/material.dart';

import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class MediaView extends StatelessWidget {
  const MediaView({Key key, @required this.media}) : super(key: key);

  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.7,
            flexibleSpace: FlexibleSpaceAppBar(media: this.media),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Container(
                height: size.height,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FlexibleSpaceAppBar extends StatelessWidget {
  const FlexibleSpaceAppBar({Key key, @required this.media}) : super(key: key);
  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            width: size.width,
            height: size.height * 0.7,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
