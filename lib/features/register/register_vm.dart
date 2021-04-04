import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo/services/auth.dart';
import '../../cores/routes/auto_router.gr.dart';

@injectable
class RegisterViewModel extends BaseViewModel {
  final AuthService _authService;
  final SnackbarService _snackbarService;
  final NavigationService _navigationService;

  StreamSubscription? userSubscription;

  RegisterViewModel(
      this._authService, this._snackbarService, this._navigationService);

  void initialise() {
    userSubscription = _authService.user.listen((user) {
      if (user != null) {
        _navigationService.replaceWith(Routes.homeViewRoute);
      }
    });
  }

  @override
  void dispose() {
    userSubscription?.cancel();
    super.dispose();
  }

  void googleSignIn() async {
    print("hi");
    User? user = await _authService.googleLogin();
    print('hello $user');
    if (user == null) {
      _snackbarService.showSnackbar(message: "Login Failed!");
    } else {
      print(user);

      _navigationService.replaceWith(Routes.homeViewRoute);
    }
  }
}
