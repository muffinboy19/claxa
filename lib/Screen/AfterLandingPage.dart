import 'package:flutter/material.dart';
import 'package:gleo_x/Elements/Buttons/white_border_blue_button.dart';
import 'package:gleo_x/style/colour.dart'; // Ensure this path is correct // Import the strings file
import '../Elements/Buttons/white_button.dart';
import '../style/string.dart';

class AfterLandingPage extends StatelessWidget {
  const AfterLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  const Text(
                    appName,
                    style: TextStyle(
                      fontFamily: 'boxx',
                      color: White,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Image.asset(
                    imageAssetPath,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  const Text(
                    sloganl1,
                    style: TextStyle(
                      fontFamily: 'boxx',
                      color: White,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    sloganl2,
                    style: TextStyle(
                      fontFamily: 'boxx',
                      color: White,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  WhiteButton(
                    text: createAccountButtonText,
                    borderRadius: 15,
                    onPressed: () {
                      // Handle create account button press
                    },
                  ),
                  const SizedBox(height: 10),
                  white_border_blue_button(
                    text: alreadyHaveAccountText,
                    borderRadius: 15,
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
