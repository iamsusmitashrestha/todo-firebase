import 'package:Caption_MVVM/common/constants/button_size.dart';

import './../../common/widgets/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'k_circular_icon_button.dart';

class KQuantityPicker extends StatelessWidget {
  final Function onMinus;
  final Function onPlus;
  final dynamic value;
  final ButtonSize size;

  KQuantityPicker(
      {this.onMinus, this.onPlus, this.value, this.size = ButtonSize.MEDIUM});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        KCircularIconButton(
          size: size,
          icon: Icons.remove,
          onPressed: onMinus,
        ),
        sWidthSpan,
        Text(
          "$value",
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        sWidthSpan,
        KCircularIconButton(
          size: size,
          icon: Icons.add,
          onPressed: onPlus,
        ),
      ],
    );
  }
}
