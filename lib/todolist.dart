import 'package:flutter/material.dart';
import 'package:flutter_application_1/todolist.dart';
class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
late String title;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
List<Todo> todolist = [];

class _TodolistState extends State<Todolist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Kayıt Ekle'),
        actions: const [
          Icon(Icons.settings),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Form(
                key: formKey,
                child: TextFormField(
                  autovalidateMode: autovalidateMode,
                  onSaved: (newValue) {
                    title = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Boş geçilemez!!";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: "Başlık", hintText: "Başlık giriniz"),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 5,
                    color: Colors.transparent,
                  ),
                  itemCount: todolist.length,
                  itemBuilder: (BuildContext context, int index) {
                    Todo item = todolist[index];
                    return ListTile(
                      tileColor: item.isComplated
                          ? Colors.green[100]
                          : Colors.red[100],
                      title: Text(
                        "${item.id} - ${item.title}",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough),
                      ),
                      subtitle: const Text("tıkla ve tamamla"),
                      leading: const Icon(Icons.list),
                      trailing: const Icon(Icons.close),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }

  void addTodo() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        todolist.add(Todo(
            id: todolist.isNotEmpty ? todolist.last.id! + 1 : 1,
            title: title,
            isComplated: false));
      });
      debugPrint(todolist.toString());
      alertSuccess();
      formKey.currentState!.reset();
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void alertSuccess() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kapat"))
              ],
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 72,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text("Kayıt Eklendi!")),
                  ],
                ),
              ),
            ));
  }
}

class Todo {
  int? id;
  String? title;
  bool isComplated;

  Todo({required this.id, required this.title, required this.isComplated});
}
