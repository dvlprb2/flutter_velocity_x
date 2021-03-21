import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'main.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    // Define when this widget should re render
    VxState.watch(context, on: [AddTask, MarkCompleted]);

    // Get access to the store
    MyStore store = VxState.store;

    return Scaffold(
      appBar: AppBar(
        title: "Todo".text.make(),
        backgroundColor: Vx.coolGray900,
        brightness: Brightness.dark,
      ),
      body: store.todoList.length > 0
          ? ListView.separated(
              itemCount: store.todoList.length,
              separatorBuilder: (context, index) => Divider(
                height: 1.0,
              ),
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final _item = store.todoList[index];
                return CheckboxListTile(
                  title: _item.title.text.make(),
                  subtitle: _item.description.text.make(),
                  value: _item.completed,
                  onChanged: (bool val) => MarkCompleted(index),
                  contentPadding: EdgeInsets.zero,
                );
              },
            )
          : EmptyList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddTodoDialog(),
        child: Icon(Icons.add),
        backgroundColor: Vx.coolGray900,
      ),
    );
  }

  void _openAddTodoDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return AddTaskDialog();
        },
        fullscreenDialog: true));
  }
}

class _TaskData {
  String title, description;
  bool completed;
}

class AddTaskDialog extends StatelessWidget {
  final _TaskData _data = new _TaskData();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Task".text.make(),
        backgroundColor: Vx.coolGray900,
        brightness: Brightness.dark,
      ),
      body: Form(
        key: _formKey,
        child: VStack(
          [
            TextFormField(
              onSaved: (String value) {
                this._data.title = value;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  contentPadding: EdgeInsets.all(16.0)),
            )
                .box
                .withRounded(value: 4.0)
                .border(color: Vx.coolGray500, width: 1.0)
                .margin(EdgeInsets.only(bottom: 12.0))
                .make(),
            TextFormField(
              onSaved: (String value) {
                this._data.description = value;
              },
              minLines: 3,
              maxLines: 6,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description",
                  contentPadding: EdgeInsets.all(16.0)),
            )
                .box
                .withRounded(value: 4.0)
                .border(color: Vx.coolGray500, width: 1.0)
                .margin(EdgeInsets.only(bottom: 12.0))
                .make(),
            MaterialButton(
              onPressed: () {
                _formKey.currentState.save();
                Task _task =
                    Task(this._data.title, this._data.description, false);
                AddTask(_task);
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              minWidth: context.screenWidth,
              color: Vx.coolGray900,
              child: "Save"
                  .text
                  .size(16.0)
                  .uppercase
                  .center
                  .white
                  .bodyText2(context)
                  .semiBold
                  .letterSpacing(1.0)
                  .make(),
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ).box.make()
          ],
        ).box.p16.make(),
      ),
    );
  }
}

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack([
      Icon(Icons.inbox_outlined, size: 80.0, color: Vx.coolGray500)
          .box
          .makeCentered(),
      "Don't have any tasks"
          .text
          .headline5(context)
          .makeCentered()
          .box
          .py4
          .makeCentered(),
      "Looks like everything's organized in the right place."
          .text
          .size(14.0)
          .makeCentered()
    ]).box.makeCentered();
  }
}
