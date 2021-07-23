import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: RaisedButton(
        color: Colors.green,
        onPressed: () {},
        child: Text(
          "Validar Campos",
          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
        ),
      ),
    );
  }
}
