import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase{
  List todoList = [];

  //reference the store--------------------------------------------------------
  final _myBox = Hive.box('MyBox');

 //first time opening app------------------------------------------------------
  void createInitialData () {
    todoList = [
      ["Meeting with john", false, "discussion on some new plans"]
    ];
  }

  //load database--------------------------------------------------------------
  void loadData() {
    todoList = _myBox.get("TodoList");
  }

  //update database------------------------------------------------------------
  void updateDatabase() {
    _myBox.put("TodoList", todoList);
  }
}