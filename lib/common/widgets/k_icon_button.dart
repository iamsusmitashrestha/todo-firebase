import 'package:flutter/material.dart';

class KIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final bool isBusy;

  KIconButton(
      {required this.icon,
      required this.onPressed,
      required this.isBusy = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      child: RaisedButton(
        padding: EdgeInsets.zero,
        onPressed: isBusy ? () {} : onPressed,
        color: Theme.of(context).primaryColor,
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
