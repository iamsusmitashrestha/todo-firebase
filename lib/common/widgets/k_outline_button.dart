import 'package:flutter/material.dart';

class KOutlineButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  KOutlineButton({this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        // padding: mPadding,
        // color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}
