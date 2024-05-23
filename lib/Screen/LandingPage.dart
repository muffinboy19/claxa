import 'package:flutter/material.dart';
import 'package:gleo_x/style/colour.dart'; // Ensure this path is correct
import '../style/string.dart'; // Ensure this path is correct

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/png/splashScreenBackhround.png', // Update this to your background image path
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 200), // Increased spacing to bring down the app name text
                      const Text(
                        appName,
                        style: TextStyle(
                          fontFamily: 'boxx',
                          color: deepPurple,
                          fontSize: 64, // Increased font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5), // Reduced spacing to bring the app name closer to the image
                      Image.asset(
                        imageAssetPath,
                        height: 200,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 20.0), // Added bottom padding
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: deepPurple,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: deepPurple, width: 2), // Increased border thickness
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          minimumSize: const Size(double.infinity, 50), // Ensures the button width is the same as the phone width
                          elevation: 5, // Added shadow
                          shadowColor: Colors.black, // Shadow color
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          createAccountButtonText,
                          style: TextStyle(
                            fontFamily: 'boxx',
                            color: deepPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: Colors.white, width: 2),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          minimumSize: Size(double.infinity, 50), // Ensures the button width is the same as the phone width
                          elevation: 5, // Added shadow
                          shadowColor: Colors.black, // Shadow color
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          alreadyHaveAccountText,
                          style: TextStyle(
                            fontFamily: 'boxx',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
