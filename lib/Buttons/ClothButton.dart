import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:liquid_button/CustomThings/ClothCustomPainter.dart';

class ClothButton extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  final Color backgroundColor;
  final double expandFactor;

  ClothButton(
      {Key key,
      @required this.height,
      @required this.width,
      this.child,
        @required this.backgroundColor,
      this.expandFactor = 10.0})
      : super(key: key) {
    assert(expandFactor > 1.0 || expandFactor < 50.0);
  }

  @override
  _ClothButtonState createState() => _ClothButtonState();
}

class _ClothButtonState extends State<ClothButton>
    with TickerProviderStateMixin {
  Offset position;
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    position = Offset(widget.width / 2, widget.height / 2);
    animationController = new AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
    animation = new Tween<double>(begin: 1.0, end: widget.expandFactor)
        .animate(animationController)
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
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: MouseRegion(
        onHover: onHover,
        onExit: onExit,
        onEnter: onEnter,
        child: Center(
          child: CustomPaint(
            painter: ClothCustomPainter(
                position, animation.value.toInt(), widget.backgroundColor),
            child: Center(child: widget.child),
          ),
        ),
      ),
    );
  }

  void onHover(PointerHoverEvent event) {
    setState(() {
      position = renderBox.globalToLocal(event.position);
    });
  }

  void onEnter(PointerEnterEvent event) {
    animationController.reverse(from: widget.expandFactor);
  }

  void onExit(PointerExitEvent event) {
    animationController.forward(from: 0.0);
  }
}
