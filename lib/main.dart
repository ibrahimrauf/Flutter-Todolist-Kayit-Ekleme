import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/todolist.dart';
void main(List<String> args) {
  runApp(const App());
}

/*class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluter Proje',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Toplama(),
    );
  }
}*/
/*class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Benim Projem',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Nalan(),
    );
  }
}*/
class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Proje',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Todolist(),
    );
  }
}
