import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'Exercicios/Exercicio1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Reforço Lucas Martins'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.purple, Colors.blue])),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Gustavinho, esses são os exercícios de reforço que me passou.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FabCircularMenu(children: <Widget>[
          IconButton(
              icon: Icon(Icons.note_alt_outlined),
              tooltip: "Exercício 5",
              onPressed: () {
                print('Exercício 5');
              }),
          IconButton(
              icon: Icon(Icons.note_alt_outlined),
              tooltip: "Exercício 4",
              onPressed: () {
                print('Exercício 4');
              }),
          IconButton(
              icon: Icon(Icons.note_alt_outlined),
              tooltip: "Exercício 3",
              onPressed: () {
                print('Exercício 3');
              }),
          IconButton(
              icon: Icon(Icons.note_alt_outlined),
              tooltip: "Exercício 2",
              onPressed: () {
                print('Exercício 2');
              }),
          IconButton(
              icon: Icon(Icons.note_alt_outlined),
              tooltip: "Exercício 1",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ExerciseOne()));
                print('Exercício 1');
              })
        ]));
  }
}
