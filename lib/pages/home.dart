import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> todoList = [];
  String currentAction = "";



  @override
  Widget build(BuildContext context) {
    setState(() {
      _getPrefs();
    });
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
                      _setPrefs();
                    },
                  ),
                ),
              ),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  todoList.removeAt(index);
                });
                _setPrefs();
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
                      _setPrefs();
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

  void _setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('TodoList', todoList);
  }

  void _getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todoList = prefs.getStringList('TodoList')!;
    });

  }

}
