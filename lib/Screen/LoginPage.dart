import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For jsonEncode and jsonDecode
import 'package:gleo_x/style/colour.dart'; // Ensure this path is correct
import 'package:shared_preferences/shared_preferences.dart'; // For storing the token
import '../style/string.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controllers for text fields
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // Function to handle login
    Future<void> handleLogin() async {
      final response = await http.post(
        Uri.parse('https://gleoai.com/api/v2/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
          'validLogin':'true'
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        // Handle successful login, e.g., save token, navigate to another screen
        final token = responseData['authToken'];

        // Save token in shared preferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', token);

        print('Login successful: $token');
      } else {
        // Handle error
        print('Login failed: ${response.statusCode}');
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/png/loginPageBackground.png', // Update this to your background image path
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          appName,
                          style: TextStyle(
                            fontFamily: 'boxx',
                            color: deepPurple,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0), // Add padding here
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: greyWhite.withOpacity(
                                  0.8), // Add opacity for better text visibility
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.white,
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
                                    color: deepPurple,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0.0),
                                  child: Image.asset(
                                    'assets/png/gleopic.png',
                                    height: 120,
                                  ),
                                ),
                                const SizedBox(
                                    height:
                                        10.0), // Increased spacing between the image and input field
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 60,
                                  child: TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                      hintText: emailHint,
                                      hintStyle: const TextStyle(
                                        color: greyBlack,
                                        fontSize: 18,
                                        fontFamily: 'boxx',
                                      ),
                                      filled: true,
                                      fillColor: lavender,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: greyBlack,
                                      fontSize: 18,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 60,
                                  child: TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                      hintText: passwordHint,
                                      hintStyle: const TextStyle(
                                        color: greyBlack,
                                        fontSize: 18,
                                        fontFamily: 'boxx',
                                      ),
                                      filled: true,
                                      fillColor: lavender,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    obscureText: true,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: greyBlack,
                                      fontSize: 18,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                ElevatedButton(
                                  onPressed: () async {
                                    await handleLogin();
                                    Navigator.pushNamed(context, '/home');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: deepPurple,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 5), // Decreased size
                                    minimumSize: const Size.fromHeight(40),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                  ),
                                  child: const Text(
                                    continueButtonText,
                                    style: TextStyle(
                                      fontFamily: 'boxx',
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    height:
                                        5.0), // Padding below the continue button
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: deepPurple,
                                      radius: 5,
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: deepPurple,
                                        thickness: 1.5,
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: deepPurple,
                                      radius: 5,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
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
                        // const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0), // Add bottom padding
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    color: Colors.white, width: 2),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              minimumSize: const Size(double.infinity, 50),
                              elevation: 5,
                              shadowColor: Colors.black,
                            ),
                            onPressed: () async {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(
                              "Sign Up", // Update the text as needed
                              style: TextStyle(
                                fontFamily: 'boxx',
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
