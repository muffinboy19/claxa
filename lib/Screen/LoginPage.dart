import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0784B5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'GLEO',
                style: TextStyle(
                  fontFamily: 'boxx',
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF60a6c1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'WELCOME BACK!!',
                        style: TextStyle(
                          fontFamily: 'boxx',
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Image.asset(
                        'assets/png/gleopic.png',
                        height: 100,
                      ),
                      const SizedBox(height: 14.0),
                       SizedBox(
                        width: double.infinity,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter email-id/Phone No.',
                            hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'boxx'
                            ),
                            filled: true,
                            fillColor: const Color(0xFFC7DCE4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Set border radius
                              borderSide: BorderSide.none, // Remove border side
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14.0),
                       SizedBox(
                        width: double.infinity,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter password',
                            hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'boxx'
                            ),
                            filled: true,
                            fillColor: Color(0xFFC7DCE4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0), // Set border radius
                              borderSide: BorderSide.none, // Remove border side
                            ),
                          ),
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Add your continue logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0784B5),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'boxx',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Add your Facebook login logic here
                            },
                            icon: const Icon(Icons.facebook, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              // Add your Google login logic here
                            },
                            icon: const Icon(Icons.g_translate, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              // Add your LinkedIn login logic here
                            },
                            icon: const Icon(Icons.app_blocking, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD3D9D5),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    // Add your login logic here
                    Navigator.pushReplacementNamed(context, '/home');
                  },

                  child:  const Text(
                      'I ALREADY HAVE AN ACCOUNT',
                      style: TextStyle(
                        fontFamily: 'boxx',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )

                ),
            ],
          ),
        ),
      ),
    );
  }
}
