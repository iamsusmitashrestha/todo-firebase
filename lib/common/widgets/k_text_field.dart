import '../../common/widgets/ui_helpers.dart';
import 'package:flutter/material.dart';

class KTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final String? hintText;
  KTextField(
      {required this.controller,
      this.obscureText = false,
      required this.keyboardType,
      this.maxLines,
      this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: maxLines != null ? sPadding : sXPadding,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(fontSize: 16, color: Colors.black38),
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
    );
  }
}
