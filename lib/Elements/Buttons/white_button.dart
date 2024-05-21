// lib/widgets/create_account_button.dart

import 'package:flutter/material.dart';
import 'package:gleo_x/style/colour.dart';

class WhiteButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final VoidCallback onPressed;

  const WhiteButton({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: White,
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
            color: Black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
