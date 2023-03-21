import 'package:flutter/material.dart';

class MyTextInputfieldWidget extends StatefulWidget {
  TextEditingController? controller;
  String? hinttext;
  IconData? iconData;

  MyTextInputfieldWidget(
      {super.key,
      this.controller,
      required this.hinttext,
      required this.iconData});

  @override
  State<MyTextInputfieldWidget> createState() => _MyTextInputfieldState();
}

class _MyTextInputfieldState extends State<MyTextInputfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 232, 231, 231),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        style: const TextStyle(color: Colors.black87),
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hinttext,
          hintStyle: const TextStyle(color: Colors.black54),
          prefixIcon: Icon(
            widget.iconData,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
