import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  fontFamily: 'Berlin Sans FB Demi',
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
                    color: const Color(0xFF91B8C7),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'WELCOME BACK!!',
                        style: TextStyle(
                          fontFamily: 'Berlin Sans FB Demi',
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Image.asset(
                        'assets/png/gleopic.png', // Corrected image path
                        height: 100,
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                        ),
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
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
                          'CONTINUE',
                          style: TextStyle(
                            fontFamily: 'Berlin Sans FB Demi',
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
                          CircleAvatar(radius: 4.0, backgroundColor: Colors.white),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Divider(
                              color: Colors.white,
                              thickness: 2.0,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          CircleAvatar(radius: 4.0, backgroundColor: Colors.white),
                        ],
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
                            icon: const Icon(Icons.g_translate, color: Colors.white), // Use Flutter's built-in Google icon
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
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 2.0),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    // Add your login logic here
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text(
                    'I ALREADY HAVE AN ACCOUNT',
                    style: TextStyle(
                      fontFamily: 'Berlin Sans FB Demi',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
