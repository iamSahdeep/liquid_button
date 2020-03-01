import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:liquid_button/CustomThings/LiquidButtonCustomPainter.dart';

class LiquidButton extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color gradientColor;
  final int gap;
  final Duration duration;
  final bool retainGradient;
  final double tension;
  final double expandFactor;

  LiquidButton({Key key,
    @required this.height,
    @required this.width,
    @required this.backgroundColor,
    this.gradientColor,
    this.gap = 1,
    this.duration = const Duration(milliseconds: 500),
    this.retainGradient = false,
    this.tension = 0.04,
    this.expandFactor = 10,
    this.child})
      : super(key: key) {
    assert(expandFactor >= 1.0 && expandFactor <= 50.0);
    assert(gap >= 1 && gap <= height / 2);
    assert(tension >= 0.01 && tension <= 1.0);
  }

  @override
  _LiquidButtonState createState() => _LiquidButtonState();
}

class _LiquidButtonState extends State<LiquidButton>
    with TickerProviderStateMixin {
  Offset position = Offset(0, 0);
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(
        duration: widget.duration, vsync: this);
    animation =
    new Tween<double>(begin: 1.0, end: widget.expandFactor).animate(
        animationController)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward(from: 0.0);

    super.initState();
  }

  RenderBox renderBox;

  @override
  Widget build(BuildContext context) {
    renderBox = context.findRenderObject();
    return MouseRegion(
      onHover: onHover,
      onExit: onExit,
      onEnter: onEnter,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: CustomPaint(
          painter: LiquidButtonCustomPainter(
              canvasColor: widget.backgroundColor,
              gap: widget.gap,
              retainGradient: widget.retainGradient,
              tension: widget.tension,
              gradientColor: widget.gradientColor ?? widget.backgroundColor,
              position: position,
              maxExpansion: widget.expandFactor,
              expandFactor: animation.value),
          child: Center(child: widget.child),
        ),
      ),
    );
  }

  void onHover(PointerHoverEvent event) {
    setState(() {
      position = renderBox.globalToLocal(event.localPosition);
    });
  }

  void onEnter(PointerEnterEvent event) {
    animationController.reverse(from: widget.expandFactor);
  }

  void onExit(PointerExitEvent event) {
    animationController.forward(from: 0.0);
  }
}
