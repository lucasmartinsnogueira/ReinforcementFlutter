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

class CPFValidator {
  static const List<String> BLACKLIST = [
    "00000000000",
    "11111111111",
    "22222222222",
    "33333333333",
    "44444444444",
    "55555555555",
    "66666666666",
    "77777777777",
    "88888888888",
    "99999999999",
    "12345678909"
  ];

  static const STRIP_REGEX = r'[^\d]';

  // Compute the Verifier Digit (or "Dígito Verificador (DV)" in PT-BR).
  // You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  static int _verifierDigit(String cpf) {
    List<int> numbers =
        cpf.split("").map((number) => int.parse(number, radix: 10)).toList();

    int modulus = numbers.length + 1;

    List<int> multiplied = [];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    int mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  static String format(String cpf) {
    RegExp regExp = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');

    return strip(cpf).replaceAllMapped(
        regExp, (Match m) => "${m[1]}.${m[2]}.${m[3]}-${m[4]}");
  }

  static String strip(String? cpf) {
    RegExp regExp = RegExp(STRIP_REGEX);
    cpf = cpf == null ? "" : cpf;

    return cpf.replaceAll(regExp, "");
  }

  static bool isValid(String? cpf, [stripBeforeValidation = true]) {
    if (stripBeforeValidation) {
      cpf = strip(cpf);
    }

    // CPF must be defined
    if (cpf == null || cpf.isEmpty) {
      return false;
    }

    // CPF must have 11 chars
    if (cpf.length != 11) {
      return false;
    }

    // CPF can't be blacklisted
    if (BLACKLIST.indexOf(cpf) != -1) {
      return false;
    }

    String numbers = cpf.substring(0, 9);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) ==
        cpf.substring(cpf.length - 2);
  }

  static String generate([bool useFormat = false]) {
    String numbers = "";

    for (var i = 0; i < 9; i += 1) {
      numbers += Random().nextInt(9).toString();
    }

    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return (useFormat ? format(numbers) : numbers);
  }
}
