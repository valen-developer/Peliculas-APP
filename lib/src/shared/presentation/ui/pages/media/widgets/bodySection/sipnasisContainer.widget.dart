import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class SipnasisContainerWidget extends StatelessWidget {
  const SipnasisContainerWidget({
    Key key,
    @required this.media,
  }) : super(key: key);

  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Sipnásis',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: size.width,
            child: Text(
              this.media.overview.value,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
            ),
          )
        ],
      ),
    );
  }
}
