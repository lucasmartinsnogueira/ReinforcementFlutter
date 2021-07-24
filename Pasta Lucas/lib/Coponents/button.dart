import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  final Function()? onPressed;

  CustomButtom({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.orange,
      onPressed: widget.onPressed,
      child: Center(
          child: Text(
        "Validar",
        style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
      )),
    );
  }
}
