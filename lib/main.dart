import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gleo_x/Screen/HomePage.dart';
import 'package:gleo_x/Screen/SplashPage.dart';
import 'package:gleo_x/Screen/detailsPage.dart';
import 'package:gleo_x/Screen/forgetPassword.dart';
import 'package:gleo_x/Screen/otpPage.dart';
import 'package:gleo_x/Screen/RegisterPage.dart';
import 'Screen/Question/questionScreen.dart';
import 'Screen/Question/QuestionType1.dart';

import 'Screen/landingPage.dart';
import 'Screen/LoginPage.dart';
import 'Screen/learn_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

// width: 60, // Width of the card
// height: 80, // Height of the card


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false, // Set this to false
      routes: {
        '/': (context) =>    QuestionType1pageWidget(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/otp-verification': (context) => const OTPVerificationScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/learn': (context) =>  LessonMapScreen(),
        '/LandingPage': (context) => const LandingPage(),
        '/register': (context) => const RegisterPage(),
        '/details': (context) => const DetailsPage(),
      },
    );
  }
}
