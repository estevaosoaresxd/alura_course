import 'package:alura_widgets/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class TaskInheritedWidget extends InheritedWidget {
  TaskInheritedWidget({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<CardWidget> taskList = [
    CardWidget(
        title: 'Aprender Flutter',
        asset: 'assets/images/dash.png',
        difficulty: 3),
  ];

  void addTask(String title, String asset, int difficulty) {
    taskList
        .add(CardWidget(title: title, asset: asset, difficulty: difficulty));
  }

  static TaskInheritedWidget? of(BuildContext context) {
    final TaskInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<TaskInheritedWidget>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInheritedWidget oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
