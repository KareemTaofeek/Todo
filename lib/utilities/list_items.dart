// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListItems extends StatelessWidget {
  final String TaskName;
  final String TaskDescription;
  final bool BoxChecked;
  Function(bool?)? onChanged;
  Function (BuildContext)? deleteFunction;

  ListItems({
    Key? key,
    required this.deleteFunction,
    required this.TaskName,
    required this.BoxChecked,
    required this.onChanged,
    required this.TaskDescription
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0,left: 20,right: 20),
      child: Row(
        children: [
          Expanded(
            child: Slidable(
              endActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: deleteFunction,
                    backgroundColor: Colors.redAccent,
                    icon: Icons.delete,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TaskName,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: BoxChecked ? TextDecoration.lineThrough : TextDecoration.none
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          TaskDescription,
                          style: TextStyle(
                              color: Colors.grey[200],
                              decoration: BoxChecked ? TextDecoration.lineThrough : TextDecoration.none),),
                      ],
                    ),

                    //checkbox---------------------------------------------------
                    Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.blueAccent,
                        value: BoxChecked,
                        onChanged: onChanged
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
