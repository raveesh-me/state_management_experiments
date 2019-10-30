import 'package:flutter/material.dart';

class SetStateExperimentScreen extends StatefulWidget {
  @override
  _SetStateExperimentScreenState createState() =>
      _SetStateExperimentScreenState();
}

class _SetStateExperimentScreenState extends State<SetStateExperimentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setState'),
      ),
    );
  }
}
