import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

@injectable
class DatabaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("Todo");

  Future<void> addTodo(String title, String uid) {
    return todoCollection.add({
      "title": title,
      "isComplete": false,
      "uid": uid,
    });
  }

  deleteTodo(String id) {
    todoCollection.doc(id).delete();
  }

  completeTodo(String id, bool isComplete) {
    return todoCollection.doc(id).update({
      "isComplete": isComplete,
    });
  }
}
