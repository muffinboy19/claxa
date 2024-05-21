import 'package:flutter/material.dart';
import 'package:gleo_x/Elements/Buttons/white_button.dart';
import 'package:gleo_x/style/colour.dart';
import '../style/string.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                appName,
                style: TextStyle(
                  fontFamily: 'boxx',
                  color: White,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0), // Add padding here
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: lightblueBackground,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: White,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          welcomeText,
                          style: TextStyle(
                            fontFamily: 'boxx',
                            color: White,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Image.asset(
                            'assets/png/gleopic.png',
                            height: 120,
                          ),
                        ),
                        const SizedBox(height: 30.0), // Increased spacing between the image and input field
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              hintText: emailHint,
                              hintStyle: const TextStyle(
                                color: Black57,
                                fontSize: 18,
                                fontFamily: 'boxx',
                              ),
                              filled: true,
                              fillColor: inputFieldColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Black57,
                              fontSize: 18,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              hintText: passwordHint,
                              hintStyle: const TextStyle(
                                color: Black57,
                                fontSize: 18,
                                fontFamily: 'boxx',
                              ),
                              filled: true,
                              fillColor: inputFieldColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            obscureText: true,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Black57,
                              fontSize: 18,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            // Add your continue logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Decreased size
                            minimumSize: const Size.fromHeight(40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            continueButtonText,
                            style: TextStyle(
                              fontFamily: 'boxx',
                              color: White,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0), // Padding below the continue button
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: White,
                              radius: 5,
                            ),
                            Expanded(
                              child: Divider(
                                color: White,
                                thickness: 1.5,
                                indent: 0,
                                endIndent: 0,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: White,
                              radius: 5,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your Facebook login logic here
                              },
                              child: Image.asset(
                                'assets/png/linkdin.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                // Add your Google login logic here
                              },
                              child: Image.asset(
                                'assets/png/google.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                // Add your LinkedIn login logic here
                              },
                              child: Image.asset(
                                'assets/png/facebook.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Using Spacer and Visibility to prevent the bottom button from pushing up when the keyboard is visible
              Spacer(),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0,
                child: WhiteButton(
                  text: alreadyHaveAccountText,
                  borderRadius: 15,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
