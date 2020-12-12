import 'package:flutter/material.dart';
import 'package:peliculasApp/src/media/infrastucture/services/DataBase/InitDataBase.dart';
import 'package:peliculasApp/src/media/infrastucture/services/DataBase/createTable.dart';

import 'package:peliculasApp/src/shared/presentation/themes/main.theme.dart';
import 'src/shared/presentation/ui/pages/home/home.page.dart';

const String databaseName = 'MoviesApp';
const String seriesTableName = 'series';
const String moviesTableName = 'movies';

void main() async {
  InitMediaDataBase database = new InitMediaDataBase(databaseName);

  CreateTable moviesTable = new CreateTable();
  CreateTable seriesTable = new CreateTable();
  bool isDBOpen = await database.openDB();

  if (isDBOpen) {
    moviesTable.createDefaultTable(database.db, moviesTableName);
    seriesTable.createDefaultTable(database.db, seriesTableName);
  }

  runApp(MyApp());
}

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
