import '../../common/widgets/ui_helpers.dart';

import '../../common/constants/button_size.dart';
import 'package:flutter/material.dart';

class KCircularIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final ButtonSize size;

  KCircularIconButton({required this.icon, this.onPressed, required this.size});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: size == ButtonSize.SMALL ? sPadding : mPadding,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }
}
