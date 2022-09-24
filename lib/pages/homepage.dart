// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utilities/dialogbox.dart';
import 'package:todo/utilities/list_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('MyBox');
  TodoDatabase db = TodoDatabase();
  
  @override
  void initState() {
    //if first time opening app,create default data-----------------------------
    if(_myBox.get("TodoList") == null) {
      db.createInitialData();
    } else{
      //not the first time-----------------------------------------------------
      db.loadData();
    }
    super.initState();
  }

  //txt controllers------------------------------------------------------------
  final _controllerTitle = TextEditingController();
  final _controllerDescription = TextEditingController();

  //checkedbox was tapped------------------------------------------------------
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      _controllerDescription.clear();
      _controllerTitle.clear();
    });
    db.updateDatabase();
  }

  //method to save new task----------------------------------------------------
  void saveTask() {
    setState(() {
      db.todoList.add([_controllerTitle.text, false,_controllerDescription.text]);
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //deleting a task------------------------------------------------------------
  void deleteTask (int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  //creation of a task---------------------------------------------------------
  void AddTask () {
    showDialog(context: context, builder: (context){
      return DialogBox(
          Titlecontroller: _controllerTitle,
          Descriptioncontroller:  _controllerDescription,
        onSave: saveTask,
        onCancel: () => Navigator.of(context).pop(),
      );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //Appbar-----------------------------------------------------------------
      appBar:AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
            child: Text('ON TIME'),),
        elevation: 0,
      ),

      //Floating button--------------------------------------------------------
      floatingActionButton: FloatingActionButton (
        backgroundColor: Colors.blueGrey,
        onPressed: AddTask,
        child:Icon(
          Icons.add_circle,
          size: 25,
        ),
      ),

      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItems(
              TaskName: db.todoList[index][0],
              BoxChecked: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
              TaskDescription: db.todoList[index][2],
              deleteFunction: (context) => deleteTask(index),
          );
        },
      ),

    );
  }
}
