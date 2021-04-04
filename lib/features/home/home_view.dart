import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/cores/di/injection.dart';
import 'package:todo/services/database_service.dart';

import 'home_vm.dart';
import 'model/todo.dart';

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
          child: StreamBuilder<List<Todo>>(
              stream: DatabaseService().listTodos(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<Todo>? todos = snapshot.data;
                return Column(
                  children: [
                    Text("All Todos"),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: todos!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: model.doneTodo,
                            leading: Container(
                              padding: EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor),
                              child: todos[index].isComplete
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : Container(),
                            ),
                            title: Text(todos[index].title),
                            trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  model.removeTodo(todos[index].uid);
                                }),
                          );
                        }),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
