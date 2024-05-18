import 'package:flutter/material.dart';


class AfterLandingPage extends StatelessWidget {
  const AfterLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0784B5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0), // Add some space from the top
              child: Column(
                children: [
                  const Text(
                    'GLEO',
                    style: TextStyle(
                      fontFamily: 'Berlin Sans FB Demi',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40), // Increased space between the text and the image
                  Image.asset(
                    'assets/png/gleopic.png', // Replace with your image asset path
                    height: 200,
                  ),
                  const SizedBox(height: 20), // Space between the image and the description text
                  const Text(
                    'The Super trendy, free and fun way to learn',
                    style: TextStyle(
                      fontFamily: 'Berlin Sans FB Demi',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0), // Add padding around the buttons
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Reduced corner radius
                        ),
                      ),
                      onPressed: () {
                        // Handle create account button press
                      },
                      child: const Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(
                          fontFamily: 'Berlin Sans FB Demi',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),







                  // Space between the two buttons
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Reduced corner radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login'); // Navigate to login page
                      },
                      child: const Text(
                        'I ALREADY HAVE AN ACCOUNT',
                        style: TextStyle(
                          fontFamily: 'Berlin Sans FB Demi',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
