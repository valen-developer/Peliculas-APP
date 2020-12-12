import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:peliculasApp/src/shared/application/router.bloc.dart';
import 'package:peliculasApp/src/shared/presentation/themes/main.theme.dart';

import 'src/shared/presentation/ui/pages/home/home.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      title: 'Movies App',
      home: HomePage(),
    );
  }
}


