// ignore_for_file: sized_box_for_whitespace, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:studybuddy/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 200,
        width: 200,
        color: Colors.yellow,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  hintText: "What do you want to study?"),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButtons(
                  text: 'Save',
                  onPressed: onSave
                    
                  
                ),
                const SizedBox(
                  width: 30.10,
                ),
                MyButtons(
                  text: 'Cancel',
                  onPressed: onCancel
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
