import 'package:flutter/material.dart';

class Todo {
  final String uid;
  final String title;
  bool isComplete;

  Todo({required this.uid, required this.title, required this.isComplete});
}
