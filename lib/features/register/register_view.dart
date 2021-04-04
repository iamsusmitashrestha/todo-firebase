import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/cores/di/injection.dart';
import 'package:todo/features/register/register_vm.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.nonReactive(
      viewModelBuilder: () => locator<RegisterViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, _) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: model.googleSignIn,
              child: Text("Sign In With Google"),
            ),
          ],
        ),
      ),
    );
  }
}
