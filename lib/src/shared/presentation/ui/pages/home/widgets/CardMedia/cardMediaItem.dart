import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    Key key,
    @required this.media,
  }) : super(key: key);

  final MediaModel media;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const double containerRadius = 15.0;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(containerRadius),
      splashColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).cardColor.withOpacity(0.7),
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
        width: size.width * 0.8,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(containerRadius),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(containerRadius),
                topLeft: Radius.circular(containerRadius),
              ),
              child: Container(
                child: Hero(
                  tag: '${media.id.value}',
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/loading.png'),
                    image: NetworkImage(media.posterPath.valueWithHttp),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        media.title.value,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${media.voteAverage.value}',
                            style: Theme.of(context).textTheme.overline,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        '${media.voteCount.value} votos',
                        style: Theme.of(context).textTheme.overline,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}