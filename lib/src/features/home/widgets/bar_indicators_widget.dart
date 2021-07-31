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

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () => setState(() => _width = widget.width));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1500),
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
