import 'package:flutter/material.dart';

class BarIndicatorWidget extends StatefulWidget {
  final double width;
  final Color color;

  const BarIndicatorWidget({
    Key? key,
    required this.width,
    required this.color,
  }) : super(key: key);

  @override
  _BarIndicatorWidgetState createState() => _BarIndicatorWidgetState();
}

class _BarIndicatorWidgetState extends State<BarIndicatorWidget> {
  double _width = 0;

  void _build({int milliseconds = 1000}) => Future.delayed(
        Duration(milliseconds: milliseconds),
      ).then((value) => setState(() => _width = widget.width));

  @override
  void initState() {
    super.initState();
    _build();
  }

  @override
  void didUpdateWidget(covariant BarIndicatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.width != widget.width) _build(milliseconds: 400);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: _width,
      child: Container(
        height: 12.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360.0),
          color: widget.color,
        ),
      ),
    );
  }
}
