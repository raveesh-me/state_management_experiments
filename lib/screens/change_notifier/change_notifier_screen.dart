import 'package:flutter/material.dart';

class ChangeNotifierScreen extends StatefulWidget {
  @override
  _ChangeNotifierScreenState createState() => _ChangeNotifierScreenState();
}

class _ChangeNotifierScreenState extends State<ChangeNotifierScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Counter extends ChangeNotifier {
  // making it a singleton

}
