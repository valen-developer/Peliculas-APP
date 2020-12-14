import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/domain/models/media-models/media.model.dart';
import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/pages/media/media.page.dart';

class RecommendedMediaList extends StatelessWidget {
  const RecommendedMediaList({
    Key key,
    @required this.medias,
  }) : super(key: key);

  final List<MediaModel> medias;

  @override
  Widget build(BuildContext context) {
    final currentRoute =
        SharedInheritedWidget.of(context).routerBloc.currentRoute;
    return ListView.builder(
      itemCount: medias.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 10, bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation1, _) {
                    return FadeTransition(
                      opacity: animation1,
                      child: MediaView(
                        media: medias[index],
                        routeFrom: currentRoute,
                      ),
                    );
                  },
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/loading.png'),
                image: NetworkImage(
                  medias[index].posterPath.valueWithHttp,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
