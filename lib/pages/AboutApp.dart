import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.lightBlue,
            body: Center(
              child: Column(
                children: [
                  Text("Список дел",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
                  Center(child: Text("Это приложение для ведения списка дел."),),
                  Center(child: Text("Для добавления нового дела нажмите на кнопку '+' внизу экрана.")),
                  Center(child: Text("Для удаления смахните или нажмите на иконку с мусорным баком."))
                ],
              ),
            ),
        appBar: AppBar(
          title: Text("О приложении"),
          centerTitle: true,
        ),));
  }
}
