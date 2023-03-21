import 'package:flutter/material.dart';

class MyButtonWidget extends StatefulWidget {
  var btnText = "";
  var onClick;

  MyButtonWidget({required this.btnText, this.onClick});

  @override
  State<MyButtonWidget> createState() => _MyButtonWidgetState();
}

class _MyButtonWidgetState extends State<MyButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: widget.onClick,
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
                end: Alignment.centerLeft,
                begin: Alignment.centerRight),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.btnText,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
