import 'package:flutter/material.dart';
import 'package:reforco/Coponents/button.dart';
import 'package:reforco/Coponents/textformfield.dart';
import 'dart:math';

class ExerciseOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validação',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Validação"),
        ),
        body: SingleChildScrollView(child: FormPage()),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            CustomFormField(
              label: "Nome Completo",
              validator: (value) {
                if (value!.isEmpty) return "O campo é obrigatório.";
                if (value.length < 10)
                  return "O campo precisa ter mais de 10 caracters.";
                return null;
              },
            ),
            SizedBox(height: 30),
            CustomFormField(
                label: "Email",
                textType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty)
                    return "Gustavo, o campo é obrigatório.";
                  else if (!emailValid(value))
                    return "Gustavo, não é pra digitas letras aleatórias";
                }),
            SizedBox(height: 30),
            CustomFormField(
                label: "CPF",
                textType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return "Gustavo, o campo é obrigatório.";
                }),
            SizedBox(height: 30),
            CustomFormField(
              label: "Número do Cartão",
              validator: (value) {
                if (value!.isEmpty) return "Gustavo, campo é obrigatório.";
                if (value.length < 5)
                  return "Gustavo, o campo precisa ter mais de 4 caracters.";
                return null;
              },
            ),
            SizedBox(height: 30),
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    child: CustomFormField(
                        label: "Vencimento",
                        validator: (value) {
                          if (value!.isEmpty) return "Campo obrigatório";
                        }),
                  )),
                  Container(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                          child: CustomFormField(
                              label: "Cod. Seg.",
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "Campo obrigatório";
                                else if (value.length > 3)
                                  return "Gustavo, existe CVV com mais de 3 dígitos";
                              })))
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 55,
              child: CustomButtom(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Enviando dados para o servidor..."),
                      duration: Duration(seconds: 3),
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool emailValid(String value) {
    final RegExp regExp = RegExp(
        r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
    return regExp.hasMatch(value);
  }
}
