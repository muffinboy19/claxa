// lib/widgets/login_button.dart

import 'package:flutter/material.dart';
import 'package:gleo_x/style/colour.dart';

class white_border_blue_button extends StatelessWidget {
  final String text;
  final double borderRadius;
  final VoidCallback onPressed;

  const white_border_blue_button({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: White50,
            width: 2.0,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius), // Customizable corner radius
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'boxx',
            color: lightSkyBlue,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
