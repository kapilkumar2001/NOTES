import 'package:flutter/material.dart';
import 'package:to_do/views/note_list.dart';
import 'package:get_it/get_it.dart';
import 'services/note_services.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(() => NoteServices());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NoteList(),
    );
  }
}

