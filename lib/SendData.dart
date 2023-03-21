// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_admin/btnWidget.dart';
import 'package:quiz_admin/snackBar.dart';
import 'package:quiz_admin/textInputField.dart';

class SendData extends StatefulWidget {
  const SendData({super.key});

  @override
  State<SendData> createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();

  String? options;
  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => options = value!);
  }

  String? category;
  ValueChanged<String?> _categoryvalueChangedHandler() {
    return (value) => setState(() => category = value!);
  }

  String? pathAddress;
  bool opVal1 = false, opVal2 = false, opVal3 = false, opVal4 = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text('Quiz Admin Panel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            MyTextInputfieldWidget(
              hinttext: 'Question',
              iconData: Icons.question_mark,
              controller: questionController,
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: MyTextInputfieldWidget(
                    hinttext: 'First option',
                    iconData: Icons.list,
                    controller: option1,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    activeColor: Colors.green,
                    title: Text(
                      "Correct",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: '1',
                    groupValue: options,
                    onChanged: _valueChangedHandler(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: MyTextInputfieldWidget(
                    hinttext: 'Second option',
                    iconData: Icons.list,
                    controller: option2,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    activeColor: Colors.green,
                    title: Text(
                      "Correct",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: '2',
                    groupValue: options,
                    onChanged: _valueChangedHandler(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: MyTextInputfieldWidget(
                    hinttext: 'Third option',
                    iconData: Icons.list,
                    controller: option3,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    activeColor: Colors.green,
                    title: Text(
                      "Correct",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: '3',
                    groupValue: options,
                    onChanged: _valueChangedHandler(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: MyTextInputfieldWidget(
                    hinttext: 'Fourth option',
                    iconData: Icons.list,
                    controller: option4,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    activeColor: Colors.green,
                    title: Text(
                      "Correct",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: '4',
                    groupValue: options,
                    onChanged: _valueChangedHandler(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Select Your Category',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: RadioListTile(
                    activeColor: Colors.green,
                    title: Text(
                      "Sports",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: '1',
                    groupValue: category,
                    onChanged: _categoryvalueChangedHandler(),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    activeColor: Colors.green,
                    title: Text(
                      "Health",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: '2',
                    groupValue: category,
                    onChanged: _categoryvalueChangedHandler(),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      RadioListTile(
                        activeColor: Colors.green,
                        title: Text(
                          "Food",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: '3',
                        groupValue: category,
                        onChanged: _categoryvalueChangedHandler(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            MyButtonWidget(
              btnText: 'Send Question',
              onClick: uploadDate,
            )
          ]),
        ),
      ),
    );
  }

  Future uploadDate() async {
    if (questionController.text.isEmpty ||
        option1.text.isEmpty ||
        option2.text.isEmpty ||
        option3.text.isEmpty ||
        option4.text.isEmpty) {
      CustomSnackBar(context, Text('Please Fill all fields..'));
    } else {
      if (category == '1') {
        pathAddress = 'Sports';
      } else if (category == '2') {
        pathAddress = 'Health';
      } else if (category == '3') {
        pathAddress = 'Food';
      }

      if (options == '1') {
        opVal1 = true;
      } else if (options == '2') {
        opVal2 = true;
      } else if (options == '3') {
        opVal3 = true;
      } else if (options == '4') {
        opVal4 = true;
      }

      Map<String, dynamic> data = {
        "Question": questionController.text,
        "Options": <String, bool>{
          option1.text: opVal1,
          option2.text: opVal2,
          option3.text: opVal3,
          option4.text: opVal4,
        }
      };

      FirebaseFirestore.instance.collection(pathAddress!).add(data);
      CustomSnackBar(context, Text('Successfull..'));

      setState(() {
        questionController.clear();
        option1.clear();
        option2.clear();
        option3.clear();
        option4.clear();
      });
    }
  }
}
