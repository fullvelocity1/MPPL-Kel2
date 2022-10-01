import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    Key? key,
    required this.title,
    required this.hintTxt,
  }) : super(key: key);

  final String title, hintTxt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Title Text Field
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        // Text Field
        TextField(
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 23, top: 15, bottom: 15),
              hintText: hintTxt,
              hintStyle: const TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(37, 37, 37, 0.04)),
        ),
      ],
    );
  }
}
