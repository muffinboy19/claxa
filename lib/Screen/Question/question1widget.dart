import 'package:flutter/material.dart';

class question1widget extends StatefulWidget {
  const question1widget({Key? key}) : super(key: key);

  @override
  State<question1widget> createState() => _question1widget();
}

class _question1widget extends State<question1widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Choose the correct option',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xFF4E0760),
                  fontSize: 24,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Text(
                'I am a question and choose a correct answer for me from following.',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 100),
            buildAnswerOption('1.', 'Answer one'),
            SizedBox(height: 16),
            buildAnswerOption('2.', 'Answer two'),
            SizedBox(height: 16),
            buildAnswerOption('3.', 'Answer three'),
            SizedBox(height: 16),
            buildAnswerOption('4.', 'Answer four'),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4E0760),
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Swipe',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAnswerOption(String number, String answer) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Color(0xFFC9A4F0),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                number,
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  color: Color(0x80000000),
                  fontSize: 17,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  answer,
                  style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    color: Color(0x80000000),
                    fontSize: 17,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
