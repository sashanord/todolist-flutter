import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoList = [];
  String currentAction = "";

  @override
  void initState() {
    todoList.addAll(["Купить молоко", "Постирать вещи"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Список дел"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_sweep),
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Добавьте действие"),
                  content: TextField(
                    onChanged: (newAction) {
                      currentAction = newAction;
                    },
                  ),
                  actions: [
                    TextButton(onPressed: () {
                      setState(() {
                        todoList.add(currentAction);
                      });
                      Navigator.of(context).pop();
                    }, child: Text("Добавить"))
                  ],
                );
              });
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
