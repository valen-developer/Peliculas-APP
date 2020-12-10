import 'package:flutter/material.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';
import 'package:peliculasApp/src/shared/infrastructure/inherited_widgets/sharedInheritedWidget.dart';
import 'package:peliculasApp/src/shared/presentation/ui/widgets/bottomNavigationBarWidget/bottomNavigationBar.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SharedInheritedWidget(
      routerBloc: new RouterBloc(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
