import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo/cores/routes/auto_router.gr.dart';
import 'package:todo/services/auth.dart';
import 'package:todo/services/database_service.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final AuthService _authService;
  final NavigationService _navigationService;

  String name = "";
  bool isComplete = false;

  TextEditingController todoController = TextEditingController();

  AuthService get authService => _authService;

  HomeViewModel(this._authService, this._navigationService);

  void initialise() {}

  void logOut() {
    _authService.signOut();

    _navigationService.clearStackAndShow(Routes.registerViewRoute);
  }

  addTodo() async {
    if (todoController.text.isNotEmpty) {
      await DatabaseService().addTodo(
          todoController.text.trim(), _authService.currentUser?.uid ?? "");
      print(todoController.text);
      _navigationService.back();
    }
  }

  doneTodo() {
    notifyListeners();
  }

  removeTodo(String uid) async {
    await DatabaseService().removeTodo(uid);
  }
}
