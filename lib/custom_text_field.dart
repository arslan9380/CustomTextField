library custom_text_field;

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final  double? height;
  final  Color fillColor;
  final  String? hint;
  final Icon? leadingIcon;
  final Icon? trailingIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscure;
  final bool enable;
  final int? maxLines;
  final focusNode;

  CustomTextField(
      {this.focusNode,
      this.hint,
      this.leadingIcon,
      this.trailingIcon,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.enable = true,
      this.maxLines,
      this.height,
      this.fillColor = Colors.transparent});

  @override
  _AuthInputFieldState createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<CustomTextField> {
 late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height!=null? widget.height !>20?widget.height:20:null, //--- height can not be less than 20 otherwise we have to make the text font size too small
      child: TextField(
        focusNode: widget.focusNode ?? null,
        maxLines:obscure==true?1: widget.maxLines,
        enabled: widget.enable,
        controller: widget.controller,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        keyboardType: widget.keyboardType,
        obscureText: widget.obscure ? obscure : widget.obscure, // obscure for password fields
        textAlignVertical: TextAlignVertical.center,
        // expands: true,
        decoration: InputDecoration(
            // isCollapsed: true,
            // isDense: true,
            contentPadding: EdgeInsets.only(left: 14),
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            fillColor: widget.fillColor,
            filled: true,
            border: borderDecoration(),
            disabledBorder: borderDecoration(),
            enabledBorder: borderDecoration(),
            focusedBorder: borderDecoration(),
            errorBorder: borderDecoration(),
            prefixIconConstraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.width * 0.5,
              maxWidth: MediaQuery.of(context).size.width * 0.5,
            ),
            prefixIcon: widget.leadingIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: widget.leadingIcon,
                  )
                : null,
            suffixIcon: widget.obscure == false && widget.trailingIcon == null
                ? null
                : widget.trailingIcon != null
                    ? widget.trailingIcon
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        child: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                          color: IconTheme.of(context).color,
                        ),
                      )),
      ),
    );
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(width: 1.0, color: Colors.black),
    );
  }
}
