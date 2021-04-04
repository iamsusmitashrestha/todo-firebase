import '../../common/widgets/ui_helpers.dart';
import 'package:flutter/material.dart';

class KPrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool isBusy;
  KPrimaryButton({this.onPressed, this.text, this.isBusy = false});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      padding: sPadding,
      color: Theme.of(context).primaryColor,
      onPressed: isBusy ? null : onPressed,
      disabledColor: Theme.of(context).primaryColor.withOpacity(0.8),
      child: isBusy
          ? SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 3.0,
              ),
            )
          : Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
    );
  }
}
