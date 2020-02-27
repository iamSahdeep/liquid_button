import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class ClothCustomPainter extends CustomPainter {
  int offset;
  List<Offset> points = [];
  Offset position;

  ClothCustomPainter(this.position, this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    int pixelsWidth = (size.width - offset * 2) as int;
    int pixelsHeight = (size.height - offset * 2) as int;

    var leftTop = [offset, offset];
    var rightTop = [size.width - offset, offset];
    var rightBottom = [size.width - offset, size.height - offset];
    var leftBottom = [offset, size.height - offset];

    List<int>.generate(pixelsWidth, (index) {
      points
          .add(Offset((leftTop[0] + index) as double, (leftTop[1]) as double));
      return index;
    });

    List<int>.generate(pixelsHeight, (index) {
      points.add(
          Offset((rightTop[0]) as double, (rightTop[1] + index) as double));
      return index;
    });

    List<int>.generate(pixelsWidth, (index) {
      points.add(Offset(
          (rightBottom[0] - index) as double, (rightBottom[1]) as double));
      return index;
    });

    List<int>.generate(pixelsHeight, (index) {
      points.add(
          Offset((leftBottom[0]) as double, (leftBottom[1] - index) as double));
      return index;
    });

    Path path = Path();

    path.moveTo(points[0].dx, points[0].dy);
    points.forEach((element) {
      Offset anotherPoint = attractedPoint(element);
      path.lineTo(anotherPoint.dx, anotherPoint.dy);
    });

    final paint = Paint();
    paint.color = Colors.red;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Offset attractedPoint(Offset element) {
    double dx = element.dx - position.dx;
    double dy = element.dy - position.dy;

    double dist = Math.sqrt(dx * dx + dy * dy);
    double dist2 = Math.max(1, dist);

    double d = Math.min(dist2, Math.max(9, (dist2 / 4) - dist2));
    double D = dist2 * offset;

    return Offset(element.dx + (d / D) * (position.dx - element.dx),
        element.dy + (d / D) * (position.dy - element.dy));
  }
}
