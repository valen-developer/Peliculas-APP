import 'package:flutter/material.dart';

import 'package:peliculasApp/src/media/infrastucture/services/DataBase/InitDataBase.dart';
import 'package:peliculasApp/src/media/infrastucture/services/DataBase/createTable.dart';

import 'package:peliculasApp/src/shared/presentation/ui/myApp.dart';

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
