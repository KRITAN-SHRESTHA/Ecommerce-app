import 'package:ecommerceapp/core/utils/color.dart';
import 'package:flutter/material.dart';

Widget buildButton({
  required String text,
  required VoidCallback? onPressed,
  Color? color,
  Color? textColor,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      minimumSize: const Size(double.infinity, 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
