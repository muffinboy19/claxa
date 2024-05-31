import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:flutter/material.dart';


class noxo extends StatelessWidget {
  const noxo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ExampleRoadMap(),
        ),
      ),
    );
  }
}

class ExampleRoadMap extends StatefulWidget {
  const ExampleRoadMap({Key? key}) : super(key: key);

  @override
  State<ExampleRoadMap> createState() => _ExampleRoadMapState();
}

class _ExampleRoadMapState extends State<ExampleRoadMap> {
  @override
  Widget build(BuildContext context) {
    const iconSize = 60.0;
    const pathCornerRad = 50.0;
    const layoutSize = 350.0;

    // Generating 10 milestone icons
    final icons = List.generate(10, (index) {
      final left = index.isEven;
      return Positioned(
        left: left ? 0 : null,
        right: left ? null : 0,
        top: index * (pathCornerRad * 2),
        child: Container(
          width: iconSize,
          height: iconSize,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white),
        ),
      );
    });

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomPaint(
              painter: DashedPathPainter(
                originalPath: (size) {
                  return _customPath(size, pathCornerRad, iconSize, icons.length);
                },
                pathColors: [
                  Colors.orange,
                  Colors.blue,
                  Colors.green,
                  Colors.grey,
                  Colors.indigo,
                  Colors.orangeAccent,
                  Colors.red,
                  Colors.amberAccent,
                  Colors.pink,
                ],
                pathColor: Colors.black87,
                strokeWidth: 3,
                dashGapLength: 5.0,
                dashLength: 10.0,
              ),
              child: SizedBox(
                width: layoutSize,
                height: (pathCornerRad * 2) * (icons.length - 1) + iconSize,
                child: Stack(children: icons),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Path> _customPath(Size size, double painterCornerRad, double iconSize, int iconCount) {
    final width = size.width;

    List<Path> paths = [];

    for (int i = 0; i < iconCount - 1; i++) {
      final path = Path();

      if (i.isEven) {
        final startX = iconSize / 2;
        final startY = (i * painterCornerRad * 2) + (iconSize / 2);
        path.moveTo(startX, startY);
        path
          ..arcToPoint(
            Offset(startX + painterCornerRad, startY + painterCornerRad),
            clockwise: false,
            radius: Radius.circular(painterCornerRad),
          )
          ..relativeLineTo(width - (painterCornerRad * 2) - iconSize, 0)
          ..relativeArcToPoint(
            Offset(painterCornerRad, painterCornerRad),
            clockwise: true,
            radius: Radius.circular(painterCornerRad),
          );
      } else {
        final startX = width - iconSize / 2;
        final startY = (i * painterCornerRad * 2) + (iconSize / 2);
        path.moveTo(startX, startY);
        path
          ..arcToPoint(
            Offset(-painterCornerRad + startX, startY + painterCornerRad),
            clockwise: true,
            radius: Radius.circular(painterCornerRad),
          )
          ..relativeLineTo(-width + (painterCornerRad * 2) + iconSize, 0)
          ..relativeArcToPoint(
            Offset(-painterCornerRad, painterCornerRad),
            clockwise: false,
            radius: Radius.circular(painterCornerRad),
          );
      }

      paths.add(path);
    }

    return paths;
  }
}

class DashedPathPainter extends CustomPainter {
  final List<Path> Function(Size) originalPath;
  final List<Color> pathColors;
  final Color pathColor;
  final double strokeWidth;
  final double dashGapLength;
  final double dashLength;

  DashedPathPainter({
    required this.originalPath,
    required this.pathColors,
    required this.pathColor,
    this.strokeWidth = 3.0,
    this.dashGapLength = 5.0,
    this.dashLength = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paths = originalPath.call(size);

    for (int i = 0; i < paths.length; i++) {
      final dashedPath = _getDashedPath(
        DashedPathProperties(
          path: Path(),
          dashLength: dashLength,
          dashGapLength: dashGapLength,
        ),
        paths[i],
        dashLength,
        dashGapLength,
      );

      Color color = pathColor;
      if (i < pathColors.length) {
        color = pathColors[i];
      }

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..color = color
        ..strokeWidth = strokeWidth;
      canvas.drawPath(dashedPath, paint);
    }
  }

  @override
  bool shouldRepaint(DashedPathPainter oldDelegate) =>
      oldDelegate.originalPath != originalPath ||
          oldDelegate.pathColor != pathColor ||
          oldDelegate.pathColors != pathColors ||
          oldDelegate.strokeWidth != strokeWidth ||
          oldDelegate.dashGapLength != dashGapLength ||
          oldDelegate.dashLength != dashLength;

  Path _getDashedPath(
      DashedPathProperties pathProps,
      Path originalPath,
      double dashLength,
      double dashGapLength,
      ) {
    final metricsIterator = originalPath.computeMetrics().iterator;
    while (metricsIterator.moveNext()) {
      final metric = metricsIterator.current;
      pathProps.extractedPathLength = 0.0;
      while (pathProps.extractedPathLength < metric.length) {
        if (pathProps.addDashNext) {
          pathProps.addDash(metric, dashLength);
        } else {
          pathProps.addDashGap(metric, dashGapLength);
        }
      }
    }
    return pathProps.path;
  }
}

class DashedPathProperties {
  double extractedPathLength;
  Path path;

  final double _dashLength;
  double _remainingDashLength;
  double _remainingDashGapLength;
  bool _previousWasDash;

  DashedPathProperties({
    required this.path,
    required double dashLength,
    required double dashGapLength,
  })  : assert(dashLength > 0.0, 'dashLength must be > 0.0'),
        assert(dashGapLength >    0.0, 'dashGapLength must be > 0.0'),
            _dashLength = dashLength,
        _remainingDashLength = dashLength,
  _remainingDashGapLength = dashGapLength,
  _previousWasDash = false,
  extractedPathLength = 0.0;

  bool get addDashNext {
    if (!_previousWasDash || _remainingDashLength != _dashLength) {
      return true;
    }
    return false;
  }

  void addDash(ui.PathMetric metric, double dashLength) {
    // Calculate lengths (actual + available)
    final end = _calculateLength(metric, _remainingDashLength);
    final availableEnd = _calculateLength(metric, dashLength);
    // Add path
    final pathSegment = metric.extractPath(extractedPathLength, end);
    path.addPath(pathSegment, Offset.zero);
    // Update
    final delta = _remainingDashLength - (end - extractedPathLength);
    _remainingDashLength = _updateRemainingLength(
      delta: delta,
      end: end,
      availableEnd: availableEnd,
      initialLength: dashLength,
    );
    extractedPathLength = end;
    _previousWasDash = true;
  }

  void addDashGap(ui.PathMetric metric, double dashGapLength) {
    // Calculate lengths (actual + available)
    final end = _calculateLength(metric, _remainingDashGapLength);
    final availableEnd = _calculateLength(metric, dashGapLength);
    // Move path's end point
    ui.Tangent tangent = metric.getTangentForOffset(end)!;
    path.moveTo(tangent.position.dx, tangent.position.dy);
    // Update
    final delta = end - extractedPathLength;
    _remainingDashGapLength = _updateRemainingLength(
      delta: delta,
      end: end,
      availableEnd: availableEnd,
      initialLength: dashGapLength,
    );
    extractedPathLength = end;
    _previousWasDash = false;
  }

  double _calculateLength(ui.PathMetric metric, double addedLength) {
    return math.min(extractedPathLength + addedLength, metric.length);
  }

  double _updateRemainingLength({
    required double delta,
    required double end,
    required double availableEnd,
    required double initialLength,
  }) {
    return (delta > 0 && availableEnd == end) ? delta : initialLength;
  }
}

