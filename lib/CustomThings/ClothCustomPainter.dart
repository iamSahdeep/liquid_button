import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClothCustomPainter extends CustomPainter {
  final double expandFactor;
  final double maxExpand;
  List<Offset> points = [];
  final Offset relativePosition;
  final Color backgroundColor;
  final Color gradientColor;
  final bool retainGradient;

  ClothCustomPainter({this.maxExpand,
    this.expandFactor,
    this.relativePosition,
    this.backgroundColor,
    this.gradientColor,
    this.retainGradient});

  @override
  void paint(Canvas canvas, Size size) {
    int buttonWidth = (size.width - expandFactor * 2).toInt();
    int buttonHeight = (size.height - expandFactor * 2).toInt();

    var leftTop = [expandFactor, expandFactor];
    var rightTop = [size.width - expandFactor, expandFactor];
    var rightBottom = [size.width - expandFactor, size.height - expandFactor];
    var leftBottom = [expandFactor, size.height - expandFactor];

    List<int>.generate(buttonWidth, (index) {
      points
          .add(Offset((leftTop[0] + index) as double, (leftTop[1]) as double));
      return index;
    });

    List<int>.generate(buttonHeight, (index) {
      points.add(
          Offset((rightTop[0]) as double, (rightTop[1] + index) as double));
      return index;
    });

    List<int>.generate(buttonWidth, (index) {
      points.add(Offset(
          (rightBottom[0] - index) as double, (rightBottom[1]) as double));
      return index;
    });

    List<int>.generate(buttonHeight, (index) {
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

    var gradient = RadialGradient(
        radius: size.width / size.height,
        colors: [
          retainGradient
              ? gradientColor
              : expandFactor == maxExpand ? backgroundColor : gradientColor,
          backgroundColor
        ],
        center: Alignment.center);
    final paint = Paint();
    paint.shader = gradient.createShader(Rect.fromCenter(
        center: relativePosition, height: size.height, width: size.width));
    canvas.drawPath(path, paint);
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
