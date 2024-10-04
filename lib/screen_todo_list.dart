import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

TextEditingController _inputController = TextEditingController();
List<String> tarefas = [];

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Lista de Tarefas"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextFormField(
                  controller: _inputController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Digite a sua tarefa",
                      hintStyle: TextStyle(
                        color: Colors.white24,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 3,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepPurple, width: 3),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20)))),
                ),
                SizedBox(
                  height: 54,
                ),
                Container(
                  height: 700,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onLongPress: (){
                          setState(() {
                            tarefas.removeAt(index);
                          });
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(tarefas[index]),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    tarefas.removeAt(index);
                                  });
                                },
                                child: Icon(
                                  Icons.restore_from_trash,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                setState(() {
                  if (_inputController.text.length > 0) {
                    setState(() {
                      tarefas.add(_inputController.text);
                    });
                    _inputController.clear();
                  }
                });
              },
              child: const Icon(Icons.add),
            ),
            SizedBox(
              width: 16,
            ),
            FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                setState(() {
                  tarefas = [];
                });
                _inputController.clear();
              },
              child: Icon(Icons.restore_from_trash_outlined),
            )
          ],
        ));
  }
}
