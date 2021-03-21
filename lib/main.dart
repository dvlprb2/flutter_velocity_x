import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Animation.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyStore extends VxStore {
  final List<Task> todoList = [];
}

class Task {
  String title, description;
  bool completed;

  Task(this.title, this.description, this.completed);
}

class AddTask extends VxMutation<MyStore> {
  final Task _task;

  AddTask(this._task);

  @override
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
  final TextTheme _textTheme = TextTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Velocity X',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: _textTheme,
      ),
      home: AnimationScreen(),
    );
  }
}
