import 'package:flutter/material.dart';

class IWDStatefulScreen extends StatefulWidget {
  @override
  _IWDStatefulScreenState createState() => _IWDStatefulScreenState();
}

class _IWDStatefulScreenState extends State<IWDStatefulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget'),
      ),
    );
  }
}
