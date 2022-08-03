import 'package:alura_widgets/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }

    return false;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nova Tarefa",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
            ),
            height: 650,
            width: 375,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nome da Tarefa",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "*Por favor coloque um nome na tarefa.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: difficultyController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Dificuldade da Tarefa",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (String? value) {
                      if (difficultyValidator(value)) {
                        return "*Por favor digite entre 1 e 5 válido.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: imageController,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Imagem da Tarefa",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "*Por favor coloque uma URL de imagem.";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.purpleAccent,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          Image.network(imageController.text, fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/images/no-image.png',
                        );
                      }),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        TaskInheritedWidget.of(widget.taskContext)?.addTask(
                          nameController.text,
                          imageController.text,
                          int.parse(difficultyController.text),
                        );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            duration: const Duration(milliseconds: 1500),
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              bottom: 12,
                            ),
                            content: Container(
                                height: 60,
                                color: Colors.green,
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: LinearProgressIndicator(),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Sucesso",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text("Tarefa criada com sucesso !",
                                                style: TextStyle(fontSize: 16)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Adicionar Tarefa",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
