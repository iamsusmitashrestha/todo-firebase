import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/cores/di/injection.dart';

import 'home_vm.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, _) => Scaffold(
          appBar: AppBar(
            title: Text("Todos"),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(12),
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView(
                        children: [
                          Container(
                            child: TextField(
                              controller: model.todoController,
                              decoration: InputDecoration(
                                hintText: "Todo",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: model.addTodo,
                            child: Text("Add Todo"),
                          )
                        ],
                      ),
                    );
                  });
            },
          ),
          body: SafeArea(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Todo')
                      .where("uid",
                          isEqualTo: model.authService.currentUser!.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return new ListTile(
                          leading: InkWell(
                            onTap: () {
                              print("Done");
                              model.doneTodo(
                                  document.id, !document.data()!['isComplete']);
                              print("Done");
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Theme.of(context).primaryColor,
                                color: Colors.yellow,
                              ),
                              child: model.isComplete
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : Container(),
                            ),
                          ),
                          title: new Text(document.data()!['title']),
                          trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                model.removeTodo(document.id);
                              }),
                        );
                      }).toList(),
                    );

                    // return ListView.builder(itemBuilder: (context, index) {

                    //   return ListTile(
                    //     // onTap: model.doneTodo,
                    //     leading: Container(
                    //       padding: EdgeInsets.all(2),
                    //       height: 30,
                    //       width: 30,
                    //       decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: Theme.of(context).primaryColor),
                    //       child: todos[index].isComplete
                    //           ? Icon(
                    //               Icons.check,
                    //               color: Colors.white,
                    //             )
                    //           : Container(),
                    //     ),
                    //     title: Text(todos[index].title),
                    //     trailing: IconButton(
                    //         icon: Icon(Icons.delete),
                    //         onPressed: () {
                    //           model.removeTodo(todos[index].uid);
                    //         }),
                    //   );
                    // });
                  }))),
    );
  }
}
