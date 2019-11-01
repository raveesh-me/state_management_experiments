import 'package:flutter/material.dart';
import 'package:state_management_experiments/screens/change_notifier/counter.dart';

class IsEvenWidget extends StatefulWidget {
  @override
  _IsEvenWidgetState createState() => _IsEvenWidgetState();
}

class _IsEvenWidgetState extends State<IsEvenWidget> {
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
      'isEven -> ${Counter().count % 2 == 0}',
      textScaleFactor: 3,
    );
  }
}
