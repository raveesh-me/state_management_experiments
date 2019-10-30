import 'package:flutter/material.dart';
import 'package:state_management_experiments/screens/inherited_widget_demo/iwd_bird_color.dart';
import 'package:state_management_experiments/screens/inherited_widget_demo/iwd_child_tree.dart';
import 'package:state_management_experiments/screens/inherited_widget_demo/iwd_frog_color.dart';

class IWDStatefulScreen extends StatefulWidget {
  @override
  _IWDStatefulScreenState createState() => _IWDStatefulScreenState();
}

// this state object contains the colors
class _IWDStatefulScreenState extends State<IWDStatefulScreen> {
  String frogColor = 'green';
  String birdColor = 'canary';

  changeFrogColor(String newColor) {
    frogColor = newColor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget'),
      ),
      body: BirdColor(
        color: birdColor,
        child: FrogColor(
          color: frogColor,
          changeColor: changeFrogColor,
          child: IWDChildTree(),
        ),
      ),
    );
  }
}
