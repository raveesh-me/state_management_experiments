import 'package:flutter/material.dart';

class BouncingDash extends StatefulWidget {
  @override
  _BouncingDashState createState() => _BouncingDashState();
}

class _BouncingDashState extends State<BouncingDash>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 5.0, end: 15.0).animate(_controller);
    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _animation.value,
      width: _animation.value,
      color: Colors.red,
    );
  }
}
