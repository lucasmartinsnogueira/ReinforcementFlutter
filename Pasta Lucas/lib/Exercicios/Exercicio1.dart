import 'package:flutter/material.dart';
import 'package:reforco/Coponents/button.dart';
import 'package:reforco/Coponents/textformfield.dart';

class ExerciseOne extends StatefulWidget {
  const ExerciseOne({Key? key}) : super(key: key);

  @override
  _ExerciseOneState createState() => _ExerciseOneState();
}

class _ExerciseOneState extends State<ExerciseOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício1"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("Nome")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: CustomFormField()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("Email")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: CustomFormField()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("Telefone")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: CustomFormField()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("UF")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: CustomFormField()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("Endereço")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: CustomFormField()),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButtom(),
    );
  }
}
