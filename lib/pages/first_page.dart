import 'package:alura_widgets/data/task_inherited.dart';
import 'package:alura_widgets/pages/form_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Tarefas"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                opacity = !opacity;
              });
            },
            icon:
                Icon(opacity == true ? Icons.visibility_off : Icons.visibility),
          )
        ],
      ),
      body: AnimatedOpacity(
        opacity: opacity == true ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          children: TaskInheritedWidget.of(context)!.taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((newContext) => FormPage(
                    taskContext: context,
                  )),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
