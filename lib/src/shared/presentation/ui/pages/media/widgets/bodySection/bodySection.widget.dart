import 'package:flutter/material.dart';

import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

import 'package:peliculasApp/src/shared/presentation/ui/pages/media/widgets/bodySection/mediaTitle.widget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/media/widgets/bodySection/sipnasisContainer.widget.dart';

class BodySectionWidget extends StatelessWidget {
  const BodySectionWidget({
    Key key,
    @required this.media,
  }) : super(key: key);

  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        MediaTitleWidget(media: media),
        const SizedBox(height: 40),
        SipnasisContainerWidget(media: media),
      ],
    );
  }
}
