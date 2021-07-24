import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final IconButton? suffix;
  final Icon? suffixIcon;
  final Icon? prefix;
  final String? hint;
  final String? helper;
  final String? label;
  final TextInputType textType;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String?)? onSubmitted;
  final int? maxLines;
  final int? maxLenght;
  final bool maxLenghtShow;
  final String? prefixLabel;
  final String? sufixLabel;
  final int minLines;
  bool obscure;
  final TextEditingController? controller;
  final bool? enable;
  final bool? lightColor;
  final String? initialValue;

  CustomFormField(
      {Key? key,
      this.onEditingComplete,
      this.onTap,
      this.onSubmitted,
      this.enable = true,
      this.label,
      this.suffix,
      this.hint,
      this.helper,
      this.suffixIcon,
      this.prefix,
      this.controller,
      this.maxLines,
      this.maxLenght,
      this.maxLenghtShow = false,
      this.minLines = 1,
      this.textType = TextInputType.name,
      this.validator,
      this.prefixLabel,
      this.obscure = false,
      this.onSaved,
      this.lightColor = false,
      this.initialValue,
      this.sufixLabel})
      : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      onFieldSubmitted: widget.onSubmitted,
      initialValue: widget.initialValue,
      onEditingComplete: widget.onEditingComplete,
      keyboardType: widget.textType,
      obscureText: widget.obscure,
      validator: widget.validator,
      onSaved: widget.onSaved,
      enabled: widget.enable,
      maxLines: widget.obscure == false ? widget.maxLines : 1,
      maxLength: widget.maxLenght != null ? widget.maxLenght : null,
      controller: widget.controller,
      style: TextStyle(
          color: widget.lightColor == false ? Colors.black : Colors.purple),
      decoration: InputDecoration(
        labelText: widget.label,
        prefixText: widget.prefixLabel,
        suffixText: widget.sufixLabel,
        suffixIcon: widget.suffix != null ? widget.suffix : widget.suffixIcon,
        prefixIcon: widget.prefix,
        hintText: widget.hint,
        helperText: widget.helper,
        counterText: widget.maxLenghtShow ? '${widget.maxLenght}' : '',

        fillColor: Colors.transparent.withOpacity(0.04),
        filled: true,
        //suffix: widget.suffix,
        helperStyle: TextStyle(color: Colors.grey.shade800),
        hintStyle: TextStyle(
          color: Colors.grey.shade800,
          fontStyle: FontStyle.italic,
        ),
        labelStyle: TextStyle(
          background: Paint()
            ..color = Colors.transparent
            ..strokeWidth = 20
            ..style = PaintingStyle.stroke
            ..strokeCap = StrokeCap.round
            ..strokeJoin = StrokeJoin.round,
          color: widget.lightColor == false ? Colors.black : Colors.blue,
        ),

        focusedBorder: widget.lightColor == false
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.orange, width: 2.5),
                borderRadius: BorderRadius.circular(12),
              )
            : OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.5),
                borderRadius: BorderRadius.circular(12),
              ),

        enabledBorder: widget.lightColor == false
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.amber, width: 2.1),
                borderRadius: BorderRadius.circular(12),
              )
            : OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.1),
                borderRadius: BorderRadius.circular(12),
              ),

        border: widget.lightColor == false
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.amber, width: 2.1),
                borderRadius: BorderRadius.circular(12),
              )
            : OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.yellow, width: 2.1),
                borderRadius: BorderRadius.circular(12),
              ),

        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red, width: 4)),
      ),
    );
  }
}
