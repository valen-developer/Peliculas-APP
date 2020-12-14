import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class MediaTitleWidget extends StatelessWidget {
  const MediaTitleWidget({
    Key key,
    @required this.media,
  }) : super(key: key);

  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Text(
        this.media.title.value,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
