import 'package:flutter/material.dart';
import 'package:state_management_experiments/screens/change_notifier/counter.dart';

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Counter().addListener(refresh);
  }

  @override
  void dispose() {
    Counter().removeListener(refresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${Counter().count}',
      textScaleFactor: 3,
    );
  }
}
