import 'package:flutter/material.dart';
import 'package:todolist/pages/AboutApp.dart';
import 'package:todolist/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Home(),
    '/aboutApp':(context)=>AboutApp(),
  },
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
));

