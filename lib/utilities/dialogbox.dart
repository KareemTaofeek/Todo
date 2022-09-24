// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/utilities/buttons.dart';

class DialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  final Titlecontroller;
  final Descriptioncontroller;

  DialogBox({
    Key? key,
    required this.Titlecontroller,
    required this.Descriptioncontroller,
    required this.onSave,
    required this.onCancel,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.redAccent,
      content:  Container(
        height: 280,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Title'),
            SizedBox(height: 6,),
            TextField(
              controller: Titlecontroller,
              decoration: InputDecoration(
                isDense: true,
                  border: OutlineInputBorder(),
                labelText: 'What do you want to do?'
                //hintText: 'What do you want to do?',
              ),
            ),

            SizedBox(height: 15,),

            Text('Description'),
            SizedBox(height: 6,),
            TextField(
              controller: Descriptioncontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Describe your task.',
                contentPadding: EdgeInsets.only(bottom: 60,left: 12),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(ButtonName: 'Save', onPressed: onSave),
                SizedBox(width: 5,),
                MyButtons(ButtonName: 'Cancel', onPressed: onCancel),

            ],)
          ],
        ),
      ),
    );
  }
}
