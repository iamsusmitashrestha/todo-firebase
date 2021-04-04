import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/features/home/model/todo.dart';

@injectable
class DatabaseService {
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection("Todos");

  Future? addTodo(String title, String uid) {
    if (uid == "") return null;
    return todosCollection.add({
      "title": title,
      "isComplete": false,
      "uid": uid,
    });
  }

  Future completeTask(id) async {
    await todosCollection.doc(id).update({"isComplete": true});
  }

  List<Todo> todoFromFirestore(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Todo(
        uid: e.id,
        title: e.data()!["title"],
        isComplete: e.data()!["isComplete"],
      );
    }).toList();
  }

  Stream<List<Todo>> listTodos() {
    return todosCollection.snapshots().map(todoFromFirestore);
  }

  removeTodo(uid) {
    todosCollection.doc(uid).delete();
  }
}
