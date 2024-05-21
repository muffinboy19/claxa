import 'package:flutter/material.dart';



class LearnScreen extends StatelessWidget {
  const LearnScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PositionedWidgets(),
          ],
        ),
      ),
    );
  }
}

class PositionedWidgets extends StatefulWidget {
  const PositionedWidgets({Key? key});

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
          size: Size(double.infinity, numberOfLessons * 200.0),
          painter: DashedLinePainter(numberOfLessons),
        ),
        Column(
          children: List.generate(
            numberOfLessons,
                (index) {
              const verticalSpacing = 160.0;
              final horizontalDisplacement = (index % 2 == 0) ? -120.0 : 120.0; // Increased horizontal displacement

              return Padding(
                padding: const EdgeInsets.only(top: verticalSpacing),
                child: SizedBox(
                  width: double.infinity,
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
        if (selectedLesson != -1)
          AnimatedVerticalCard(
            lessonNumber: selectedLesson + 1,
          ),
      ],
    );
  }
}

class AnimatedVerticalCard extends StatelessWidget {
  final int lessonNumber;

  const AnimatedVerticalCard({Key? key, required this.lessonNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Add perspective
        ..rotateX(-0.5), // Rotate along the X-axis for a 3D effect
      child: VerticalCard(
        lessonNumber: lessonNumber,
      ),
    );
  }
}

class VerticalCard extends StatelessWidget {
  final int lessonNumber;

  const VerticalCard({Key? key, required this.lessonNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Lesson $lessonNumber',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double startX = size.width / 2;
    double startY = 80; // Start from the top of the first card

    for (int i = 0; i < numberOfLessons - 1; i++) {
      double cardCenterY = (i * 160) + 80; // Calculate card's center Y position
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX, cardCenterY),
        paint,
      );
      canvas.drawLine(
        Offset(startX, cardCenterY),
        Offset(startX, cardCenterY + 80), // Draw a dashed line to the bottom of the card
        paint,
      );
      startY = cardCenterY + 160; // Move startY to the bottom of the next card
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

  const LessonWidget({Key? key, required this.lessonNumber, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.blue,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selected ? Colors.red : Colors.transparent,
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
