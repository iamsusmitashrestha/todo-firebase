import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'cores/di/injection.dart';
import 'cores/routes/auto_router.gr.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AutoRouter(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var db = FirebaseFirestore.instance;

//   void firebaseTest() async {
//     //Get Approach
//     // var todos = await db.collection("Todos").get();
//     // for (var doc in todos.docs) {
//     //   print(doc.data());
//     // }
//     // print(todos.docs[0].data());

//     // Stream Approach
//     // var todosStream = db.collection("Todos").snapshots();
//     // todosStream.listen((todos) {
//     //   for (var doc in todos.docs) {
//     //     print(doc.data());
//     //   }
//     // });

//     //Add with custom id
//     // await Future.wait([
//     //   db.collection("Students").doc("Manisha").set({
//     //     "score": 20,
//     //   }),
//     //   db.collection("Students").doc("Ankit").set({
//     //     "score": 100,
//     //   }),
//     //   db.collection("Students").doc("Sus").set({
//     //     "score": 90,
//     //   }),
//     //   db.collection("Students").doc("Bij").set({
//     //     "score": 80,
//     //   }),
//     //   db.collection("Students").doc("Uj").set({
//     //     "score": 2,
//     //   }),
//     // ]);

//     //Add with automatic id
//     // await db.collection("Todos").add({
//     //   "title": "Go home",
//     //   "isComplete": true,
//     // });

//     // Quering with filters
//     // var students = await db
//     //     .collection("Students")
//     //     .where('score', isGreaterThanOrEqualTo: 80)
//     //     .get();
//     // for (var doc in students.docs) {
//     //   print(doc.id);
//     // }

//     // var studentsStream = db
//     //     .collection("Students")
//     //     .where('score', isLessThanOrEqualTo: 20)
//     //     .snapshots();
//     // studentsStream.listen((students) {
//     //   for (var doc in students.docs) {
//     //     print(doc.id);
//     //   }
//     // });
//   }

//   @override
//   void initState() {
//     super.initState();
//     firebaseTest();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         // child: FutureBuilder(
//         //   future: db
//         //       .collection("Students")
//         //       .where('score', isLessThanOrEqualTo: 20)
//         //       .get(),
//         //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         //     if (!snapshot.hasData) {
//         //       return Center(
//         //         child: CircularProgressIndicator(),
//         //       );
//         //     }
//         //     return ListView(
//         //       children: [
//         //         for (var doc in snapshot.data!.docs)
//         //           Text("${doc.id} ${doc.data()!['score']}")
//         //       ],
//         //     );
//         //   },
//         // ),
//         child: FutureBuilder(
//           future: db.collection("Todos").doc("xyz").get(),
//           builder:
//               (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return Text(snapshot.data?.data()!['title']);
//           },
//         ),
//       ),
//     );
//   }
// }
