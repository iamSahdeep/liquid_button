import 'dart:math' as Math;

import 'package:flutter/material.dart';

class LiquidButtonCustomPainter extends CustomPainter {
  final double expandFactor;
  final double maxExpansion;
  List<Offset> points = [];
  final Offset position;
  final Color canvasColor;
  final Color gradientColor;
  final bool retainGradient;
  final int gap;
  final double tension;

  LiquidButtonCustomPainter(
      {@required this.expandFactor,
      @required this.position,
      @required this.gap,
      @required this.tension,
      @required this.maxExpansion,
      @required this.canvasColor,
      @required this.gradientColor,
      @required this.retainGradient});

  @override
  void paint(Canvas canvas, Size size) {
    double midTop = (size.width - doubleTilde(size.height / 2)) / 2;
    for (var x = doubleTilde(size.height / 2); x < midTop * 2; x += this.gap) {
      points.add(Offset(x, 0));
    }
    for (var alpha = doubleTilde(size.height * 1.25);
        alpha >= 0;
        alpha -= this.gap) {
      var angle = (Math.pi / doubleTilde(size.height * 1.25)) * alpha;
      points.add(Offset(
          Math.sin(angle) * size.height / 2 + 0 + size.width - size.height / 2,
          Math.cos(angle) * size.height / 2 + size.height / 2));
    }
    for (var x = size.width - doubleTilde(size.height / 2) - 1;
        x >= doubleTilde(size.height / 2);
        x -= this.gap) {
      points.add(Offset(x, -0 + size.height));
    }
    for (var alpha = 0;
        alpha <= doubleTilde(size.height * 1.25);
        alpha += this.gap) {
      var angle = (Math.pi / doubleTilde(size.height * 1.25)) * alpha;
      points.add(Offset(
          (size.height - Math.sin(angle) * size.height / 2) - size.height / 2,
          Math.cos(angle) * size.height / 2 + size.height / 2));
    }
    Path path = Path();

    var temp = attractedOffset(points[0]);
    path.moveTo(temp.dx, temp.dy);
    points.forEach((element) {
      Offset temp = attractedOffset(element);
      path.lineTo(temp.dx, temp.dy);
    });
    var gradient = RadialGradient(
        radius: size.width / size.height,
        colors: [
          retainGradient
              ? gradientColor
              : expandFactor == maxExpansion ? canvasColor : gradientColor,
          canvasColor
        ],
        center: Alignment.center);
    final paint = Paint();
    paint.shader = gradient.createShader(Rect.fromCenter(
        center: position, height: size.height, width: size.width));
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

  Offset attractedOffset(Offset element) {
    double dx = element.dx - position.dx;
    double dy = element.dy - position.dy;

    double dist = Math.sqrt(dx * dx + dy * dy);
    double dist2 = Math.max(1, dist);

    double d = Math.min(dist2, Math.max(12, (dist2 / 4) - dist2));
    double D = dist2 * expandFactor;

    return Offset(
        element.dx + (d / D) * (dx * 2), element.dy + (d / D) * (dy * 2));
  }
}
