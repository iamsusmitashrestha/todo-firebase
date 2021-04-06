import 'package:flutter/material.dart';

class KIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final bool isBusy;

  KIconButton(
      {required this.icon, required this.onPressed, this.isBusy = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      child: ElevatedButton(
        onPressed: isBusy ? () {} : onPressed,
        child: isBusy
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ))
            : Icon(
                Icons.delete,
                color: Colors.white,
              ),
      ),
    );
  }
}
