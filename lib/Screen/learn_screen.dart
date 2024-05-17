import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            PositionedWidgets(),
          ],
        ),
      ),
    );
  }
}

class PositionedWidgets extends StatefulWidget {
  const PositionedWidgets({super.key});

  @override
  _PositionedWidgetsState createState() => _PositionedWidgetsState();
}

class _PositionedWidgetsState extends State<PositionedWidgets> {
  int numberOfLessons = 10;
  int selectedLesson = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(double.infinity, numberOfLessons * 200.0), // Adjust the size of the CustomPaint
          painter: DashedLinePainter(numberOfLessons),
        ),
        Column(
          children: List.generate(
            numberOfLessons,
                (index) {
              const verticalSpacing = 160.0; // Increased vertical spacing between each card
              final horizontalDisplacement = (index % 2 == 0) ? -20.0 : 20.0; // Alternating horizontal displacement

              return Padding(
                padding: const EdgeInsets.only(top: verticalSpacing),
                child: Container(
                  width: double.infinity, // Make the container width match the screen width
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(horizontalDisplacement, 0.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLesson = index;
                          });
                        },
                        child: LessonWidget(
                          lessonNumber: index + 1,
                          selected: selectedLesson == index,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final int numberOfLessons;

  DashedLinePainter(this.numberOfLessons);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    double dashWidth = 10;
    double dashSpace = 5;
    double startY = 0;
    double startX = size.width / 2;

    for (int i = 0; i < numberOfLessons; i++) {
      double cardCenterY = startY + 80 + i * 160; // Adjust to start from the first card and space out vertically
      while (startY < cardCenterY) {
        canvas.drawLine(Offset(startX, startY), Offset(startX, startY + dashWidth), paint);
        startY += dashWidth + dashSpace;
      }
      startY = cardCenterY + dashSpace; // Move to the next card
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LessonWidget extends StatelessWidget {
  final int lessonNumber;
  final bool selected;

  const LessonWidget({super.key, required this.lessonNumber, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.blue,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selected ? Colors.red : Colors.transparent, // Change border color when selected
          width: 3,
        ),
      ),
      child: Center(
        child: Text(
          lessonNumber.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
