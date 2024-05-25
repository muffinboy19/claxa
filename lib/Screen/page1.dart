import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BoxData> boxDataList = [
      BoxData(
        heading: 'Heading 1',
        paragraph: 'Paragraph 1',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFFFEAFB2),
      ),
      BoxData(
        heading: 'Heading 2',
        paragraph: 'Paragraph 2',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFF93D4EE),
      ),
      BoxData(
        heading: 'Heading 3',
        paragraph: 'Paragraph 3',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFF8AE1DB),
      ),
      BoxData(
        heading: 'Heading 4',
        paragraph: 'Paragraph 4',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFFFED772),
      ),
      BoxData(
        heading: 'Heading 5',
        paragraph: 'Paragraph 5',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFFB2F1F3),
      ),
      BoxData(
        heading: 'Heading 6',
        paragraph: 'Paragraph 6',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFFE7E6E1),
      ),
      BoxData(
        heading: 'Heading 7',
        paragraph: 'Paragraph 7',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFFF3CFB6),
      ),
      BoxData(
        heading: 'Heading 8',
        paragraph: 'Paragraph 8',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFFB2CCFF),
      ),
      BoxData(
        heading: 'Heading 9',
        paragraph: 'Paragraph 9',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFFC2F9BB),
      ),
      BoxData(
        heading: 'Heading 10',
        paragraph: 'Paragraph 10',
        imagePath: 'assets/png/gleopic.png',
        color: const Color(0xFFD5D5D5),
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // Header takes entire width
              color: const Color(0xFFE5CCF4), // Header color
              padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello Palak !!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'boxx', // Using custom font family
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Choose your Domain',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'boxx', // Using custom font family
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ...boxDataList.map((boxData) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _buildBox(boxData),
              );
            }).toList(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(BoxData boxData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: boxData.color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4, // 40% width
              child: Image.asset(
                boxData.imagePath,
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 6, // 60% width
              child: Padding(
                padding: const EdgeInsets.only(right: 30, top: 20), // Add padding around the column
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      boxData.heading,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'boxx', // Using custom font family
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      boxData.paragraph,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'boxx', // Using custom font family
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxData {
  final String heading;
  final String paragraph;
  final String imagePath;
  final Color color;

  BoxData({
    required this.heading,
    required this.paragraph,
    required this.imagePath,
    required this.color,
  });
}
