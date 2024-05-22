import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LessonMapScreen()));
}

class LessonMapScreen extends StatelessWidget {
  final List<bool> completedLessons = [false, false, false, false];
  final List<Offset> lessonPositions = [
    Offset(50, 350),
    Offset(150, 250),
    Offset(250, 150),
    Offset(350, 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learning Path')),
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
            painter: PathwayPainter(lessonPositions: lessonPositions, completedLessons: completedLessons),
          ),
          ...List.generate(lessonPositions.length, (index) {
            return LessonNode(
              position: lessonPositions[index],
              label: '${index + 1}',
              completed: completedLessons[index],
              onTap: () {
                if (index > 0 && completedLessons[index - 1]) {
                  completedLessons[index] = true;
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonMapScreen(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Incomplete Lesson'),
                        content: Text('You need to complete the previous lesson first.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            );
          }),
        ],
      ),
    );
  }
}

class PathwayPainter extends CustomPainter {
  final List<Offset> lessonPositions;
  final List<bool> completedLessons;

  PathwayPainter({required this.lessonPositions, required this.completedLessons});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final completedPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final path = Path();
    for (int i = 0; i < lessonPositions.length; i++) {
      if (i == 0) {
        path.moveTo(lessonPositions[i].dx, lessonPositions[i].dy);
      } else {
        path.quadraticBezierTo(
          lessonPositions[i - 1].dx + 30,
          lessonPositions[i - 1].dy - 30,
          lessonPositions[i].dx,
          lessonPositions[i].dy,
        );
      }
      if (completedLessons[i]) {
        canvas.drawPath(path, completedPaint);
      } else {
        canvas.drawPath(path, paint);
      }
    }

    final dashedPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    for (int i = 0; i < lessonPositions.length - 1; i++) {
      canvas.drawLine(
        lessonPositions[i],
        lessonPositions[i + 1],
        completedLessons[i] && completedLessons[i + 1] ? completedPaint : dashedPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LessonNode extends StatelessWidget {
  final Offset position;
  final String label;
  final bool completed;
  final VoidCallback onTap;

  LessonNode({required this.position, required this.label, required this.completed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx - 20,
      top: position.dy - 20,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: completed ? Colors.green : Colors.blue,
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
