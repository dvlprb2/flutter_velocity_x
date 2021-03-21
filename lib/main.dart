import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Todo.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

final TextTheme _textTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 102, color: Color(0xff4a4c4f))),
  headline2: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 64, color: Color(0xff4a4c4f))),
  headline3: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 51, color: Color(0xff4a4c4f))),
  headline4: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 36, color: Color(0xff4a4c4f))),
  headline5: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 25, color: Color(0xff4a4c4f))),
  headline6: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 18, color: Color(0xff4a4c4f))),
  subtitle1: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 17, color: Color(0xff4a4c4f))),
  subtitle2: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
  bodyText1: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 16, color: Color(0xff4a4c4f))),
  bodyText2: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 14, color: Color(0xff4a4c4f))),
  button: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
  caption: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 13, color: Color(0xff4a4c4f))),
  overline: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 11, color: Color(0xff4a4c4f))),
);

class Task {
  String title;
  String description;
  bool completed;

  Task(this.title, this.description, this.completed);
}

class MyStore extends VxStore {
  final List<Task> todoList = [];
}

class AddTask extends VxMutation<MyStore> {
  final Task _task;

  AddTask(this._task);

  perform() => store.todoList.add(_task);
}

class MarkCompleted extends VxMutation<MyStore> {
  final int _index;

  MarkCompleted(this._index);

  @override
  perform() {
    final _item = store.todoList[_index];
    _item.completed = !_item.completed;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Velocity X',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: _textTheme,
        // inputDecorationTheme: _inputDecorationTheme,
      ),
      home: Todo(),
    );
  }
}
