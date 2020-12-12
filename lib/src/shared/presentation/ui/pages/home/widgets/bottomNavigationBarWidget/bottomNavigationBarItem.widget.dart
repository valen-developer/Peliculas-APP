import 'package:flutter/material.dart';

import 'package:peliculasApp/src/shared/application/router.bloc.dart';
import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';

class BottomNavigatorBarItem extends StatelessWidget {
  const BottomNavigatorBarItem(
      {Key key,
      @required this.title,
      @required this.icon,
      @required this.route})
      : super(key: key);

  final String title;
  final IconData icon;
  final Routes route;

  @override
  Widget build(BuildContext context) {
    final routerBloc = SharedInheritedWidget.of(context).routerBloc;

    const double containerPadding = 15.0;
    const double titleSize = 15.0;
    const iconSize = 35.0;

    const compactedContainerWidth = iconSize + containerPadding;
    const expandedContainerWidth = compactedContainerWidth + 100;
    const containerHeigth = iconSize + containerPadding;
    double containerWidth = compactedContainerWidth;

    return AnimatedBuilder(
        animation: routerBloc,
        builder: (context, child) {
          containerWidth = (this.route == routerBloc.currentRoute)
              ? expandedContainerWidth
              : compactedContainerWidth;

          return InkWell(
            //TODO: inkwell shape
            onTap: () {
              routerBloc.changeRoute(this.route);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: containerHeigth,
              width: containerWidth,
              decoration: BoxDecoration(
                color: (route == routerBloc.currentRoute)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(containerHeigth / 2),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: (containerHeigth - iconSize) / 2,
                    left: (compactedContainerWidth - iconSize) / 2,
                    child: Icon(
                      icon,
                      size: iconSize,
                    ),
                  ),
                  Positioned(
                    left: iconSize + 15,
                    top: (containerHeigth - titleSize) / 2,
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .overline
                          .copyWith(fontSize: titleSize),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
