import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key key,
    @required this.icon,
    @required this.onTap,
    @required this.margin,
    this.padding = 10,
  }) : super(key: key);

  final Icon icon;
  final VoidCallback onTap;
  final EdgeInsets margin;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final appBarButtonsBorderRadius = BorderRadius.circular(50);
    final backgroundColorForAppBarButtons =
        Theme.of(context).backgroundColor.withOpacity(0.6);

    return InkWell(
      child: Container(
        padding: EdgeInsets.all(padding),
        margin: this.margin,
        decoration: BoxDecoration(
          color: backgroundColorForAppBarButtons,
          borderRadius: appBarButtonsBorderRadius,
        ),
        child: this.icon,
      ),
      onTap: this.onTap,
    );
  }
}
