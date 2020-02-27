import 'package:flutter/cupertino.dart';

class LiquidButton extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;

  const LiquidButton({Key key, this.height, this.width, this.child})
      : super(key: key);

  @override
  _LiquidButtonState createState() => _LiquidButtonState();
}

class _LiquidButtonState extends State<LiquidButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width, height: widget.height, child: widget.child);
  }
}
