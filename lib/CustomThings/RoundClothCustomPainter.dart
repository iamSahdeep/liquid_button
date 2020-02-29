import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundClothCustomPainter extends CustomPainter {
  int expandFactor;
  List<Offset> points = [];
  Offset relativePosition;
  Color backgroundColor;
  double margin = 5;
  int gap = 2;

  RoundClothCustomPainter(
      this.relativePosition, this.expandFactor, this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    for (var x = doubleTilde(size.height / 2);
        x < size.width - doubleTilde(size.height / 2);
        x += gap) {
      points.add(Offset(expandFactor / 4 + x + margin, margin));
    }
    for (var alpha = doubleTilde(size.height * 1.25);
        alpha >= 0;
        alpha -= gap) {
      var angle = (Math.pi / doubleTilde(size.height * 1.25)) * alpha;
      points.add(Offset(
          Math.sin(angle) * size.height / 2 +
              margin +
              size.width -
              size.height / 2,
          Math.cos(angle) * size.height / 2 + margin + size.height / 2));
    }
    for (var x = size.width - doubleTilde(size.height / 2) - 1;
        x >= doubleTilde(size.height / 2);
        x -= gap) {
      points.add(Offset(x + margin + expandFactor / 4, margin + size.height));
    }
    for (var alpha = 0;
        alpha <= doubleTilde(size.height * 1.25);
        alpha += gap) {
      var angle = (Math.pi / doubleTilde(size.height * 1.25)) * alpha;
      points.add(Offset(
          (size.height - Math.sin(angle) * size.height / 2) +
              margin -
              size.height / 2,
          Math.cos(angle) * size.height / 2 + margin + size.height / 2));
    }

    Path path = Path();

    path.moveTo(points[0].dx, points[0].dy);
    points.forEach((element) {
      Offset anotherPoint = attractedPoint(element);
      path.lineTo(anotherPoint.dx, anotherPoint.dy);
    });

    final paint = Paint();
    paint.color = backgroundColor;
    canvas.drawPath(path, paint);
  }

  double doubleTilde(double x) {
    if (x < 0)
      return x.ceilToDouble();
    else
      return x.floorToDouble();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Offset attractedPoint(Offset element) {
    double dx = element.dx - relativePosition.dx;
    double dy = element.dy - relativePosition.dy;

    double dist = Math.sqrt(dx * dx + dy * dy);
    double dist2 = Math.max(1, dist);

    double d = Math.min(dist2, Math.max(9, (dist2 / 4) - dist2));
    double D = dist2 * expandFactor;

    return Offset(element.dx + (d / D) * (relativePosition.dx - element.dx),
        element.dy + (d / D) * (relativePosition.dy - element.dy));
  }
}
