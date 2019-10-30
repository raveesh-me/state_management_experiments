import 'package:flutter/material.dart';

class ParentalLoveScreen extends StatefulWidget {
  @override
  _ParentalLoveScreenState createState() => _ParentalLoveScreenState();
}

// the stateful widget that maintains colors
class _ParentalLoveScreenState extends State<ParentalLoveScreen> {
  String frogColor = 'green';
  String birdColor = 'red';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context'),
      ),
    );
  }
}
