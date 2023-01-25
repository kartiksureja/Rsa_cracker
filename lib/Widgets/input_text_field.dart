import 'package:flutter/material.dart';

class InputFieldBox extends StatelessWidget {
  InputFieldBox(
      {Key? key, required this.inLable, required this.userIdController})
      : super(key: key);

  final TextEditingController userIdController;
  final String inLable;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      cursorColor: Colors.white,
      controller: userIdController,
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: inLable,
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
        focusedBorder: UnderlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        disabledBorder: UnderlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        suffixStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
